
# Azure Control-VM

  
Die Control-VM (Virtual Machine) in einer virtuellen Umgebung ist eine spezielle virtuelle Maschine, die zur Verwaltung und Überwachung der virtuellen Umgebung eingesetzt wird. Der Zugriff auf bestehende Ressourcen, wie ein AKS-Cluster wird somit gewährleistet. Das Image kann in verschiedene Regionen bereitgestellt werden. 

Enthaltene Tools:

- terraform CLI
- argocd CLI
- kubectl
- helm
- gitlab
- jq
- k9s
- kubens
- kubeseal
- kubectx
- trivy


Das Image wird deklerativ in HCL oder JSON mit Hilfe von HashiCorp Packer erstellt. 

**Installation von Packer:**

Linux:

 1. `curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`
 2. `sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`
 3. `sudo apt-get update && sudo apt-get install packer`

Mac:

 1. `brew tap hashicorp/tap`
 2. `brew install hashicorp/tap/packer`

Windows:

 1. `choco install packer`


**Erstellen eines Images**

Zum erstellen eines neuen Image muss das Repo entsprechend geklont werden und etwaige Anpassungen, wie Distribution und Version oder Änderungen im Tool Skript erfolgen.


BILD


Die Angabe der Ressourcengruppe ist erforderlich, diese muss auch bereits im Azure vorhanden sein.
Credentials werden als Variable genutzt oder die Authentifizierung erfolgt direkt über die Azure-CLI.

Zum erstellen des Images:

    packer build .

Nach erfolgreicher Erstellung wird das Ergebnis direkt ausgegeben.

Bild

Das Image ist nun in der entsprechenden Ressourcegroup und Region vorhanden und kann zum Deployen einer- oder mehrerer VM´s genutzt werden.

**Azure AD SSH Login**
Um sich mit den Azure Active Directory Credentials anmelden zu können müssen  Anpassungen beim Deployen der VM erfolgen:

1. Im Bereich "Verwaltung" muss Systemseitig zugewiesene verwaltete Identität aktiviert werden.
2. Im Bereich "Erweitert" muss Azure AD based SSH Login ausgewählt werden.
3. User welche Zugriff auf die VM haben sollen, müssen entsprechend für Anmeldeinformationen des VM-Administrator oder VM Benutzer berechtigt sein. (Siehe IAM - Rollenzuweisung)



