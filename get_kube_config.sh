#!/bin/bash

# Server- und Benutzerinformationen
SERVER_USER="philipp"
SERVER_IP="82.165.32.152"
REMOTE_KUBECONFIG_PATH="/etc/rancher/k3s/k3s.yaml"
LOCAL_KUBECONFIG_PATH="$HOME/.kube/config"
TEMP_KUBECONFIG_ON_SERVER="/home/philipp/k3s.yaml"

# Passwort für sudo auf dem Remote-Server abfragen
read -s -p "Enter password for ${SERVER_USER}@${SERVER_IP}: " SSH_PASS
echo

# Kopieren Sie die Kubeconfig auf dem Server in ein zugängliches Verzeichnis
ssh ${SERVER_USER}@${SERVER_IP} "echo '${SSH_PASS}' | sudo -S cp ${REMOTE_KUBECONFIG_PATH} ${TEMP_KUBECONFIG_ON_SERVER} && sudo chown ${SERVER_USER}:${SERVER_USER} ${TEMP_KUBECONFIG_ON_SERVER}"

# Prüfen, ob der SSH-Befehl erfolgreich war
if [ $? -ne 0 ]; then
  echo "Fehler beim Kopieren der Kubeconfig auf dem Server"
  exit 1
fi

# Temporäre Datei zum Speichern der heruntergeladenen Kubeconfig
TEMP_KUBECONFIG=$(mktemp)

# SCP-Befehl, um die Kubeconfig vom Server zu kopieren
scp ${SERVER_USER}@${SERVER_IP}:${TEMP_KUBECONFIG_ON_SERVER} ${TEMP_KUBECONFIG}

# Prüfen, ob der SCP-Befehl erfolgreich war
if [ $? -ne 0 ]; then
  echo "Fehler beim Herunterladen der Kubeconfig vom Server"
  exit 1
fi

# Entfernen Sie die temporäre Kubeconfig-Datei vom Server
ssh ${SERVER_USER}@${SERVER_IP} "rm ${TEMP_KUBECONFIG_ON_SERVER}"

# Ändern Sie die Server-Adresse in der temporären Kubeconfig auf HTTP
sed -i 's|https://127.0.0.1:6443|http://'"${SERVER_IP}"':6443|g' ${TEMP_KUBECONFIG}

# Entfernen Sie die Zertifikatsinformationen, da sie für HTTP nicht benötigt werden
yq eval 'del(.clusters[].cluster["certificate-authority-data"])' -i ${TEMP_KUBECONFIG}
yq eval 'del(.users[].user["client-certificate-data"])' -i ${TEMP_KUBECONFIG}
yq eval 'del(.users[].user["client-key-data"])' -i ${TEMP_KUBECONFIG}

# Kubeconfig zusammenführen
export KUBECONFIG=${LOCAL_KUBECONFIG_PATH}:${TEMP_KUBECONFIG}

# Kubeconfigs zusammenführen und in einer neuen Datei speichern
kubectl config view --merge --flatten > ${LOCAL_KUBECONFIG_PATH}.new

# Die neue Kubeconfig-Datei ersetzen die alte
mv ${LOCAL_KUBECONFIG_PATH}.new ${LOCAL_KUBECONFIG_PATH}

# Temporäre Datei löschen
rm ${TEMP_KUBECONFIG}

echo "Kubeconfig erfolgreich ergänzt"
