```mermaid
sequenceDiagram
  participant Navegador
    participant script.js
    participant SAPLogin.cfc
    participant LCDM()
    Navegador ->>+ script.js: ng-init llama init()
    script.js ->>+ SAPLogin.cfc: realizar petición POST con valor method=LCDM
    SAPLogin.cfc ->>+ LCDM() : Generar nuevo token CSRF
    LCDM() -->>- SAPLogin.cfc: nuevo token CSRF
    SAPLogin.cfc -->>- script.js: Token session
    script.js -->>- Navegador: Token session
    Navegador ->>+ SAPLogin.cfc: realizar petición POST con valor method=LCDM
    LCDM() -->>- SAPLogin.cfc: nuevo token CSRF
    Navegador ->>+ script.js: ng-init llamo init()
    script.js ->>+ SAPLogin.cfc: realizar petición POST con valor method=LCDM
    SAPLogin.cfc ->>+ LCDM() : Generar nuevo token CSRF
    LCDM() -->>- SAPLogin.cfc: nuevo token CSRF
    Navegador ->>+ script.js: Token session
    script.js ->>+ SAPLogin.cfc -->>- Navegador: Token session
    SAPLogin.cfc -->>+ LCDM() : Generar nuevo token CSRF
    LCDM() -->>- SAPLogin.cfc: nuevo token CSRF
    Navegador ->>+ script.js: ng-init llamo init()
    script.js ->>+ SAPLogin.cfc: realizar petición POST con valor method=LCDM
    SAPLogin.cfc -->>+ LCDM() : Generar nuevo token CSRF
    LCDM() -->>- SAPLogin.cfc: nuevo token CSRF
    Navegador ->>+ script.js: ng-init llamo init()
    script.js ->>+ SAPLogin.cfc: realizar petición POST con valor method=LCDM
    SAPLogin.cfc ->>+ LCDM() : Generar nuevo token CSRF
    LCDM() -->>- SAPLogin.cfc: nuevo token CS
```
