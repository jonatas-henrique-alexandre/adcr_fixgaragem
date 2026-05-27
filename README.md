# **adcr\_fixgaragem**

Um script simples, leve e eficiente para servidores FiveM baseado no ecossistema QBCore / QBox. Ele resolve um problema crônico em muitas bases: veículos que ficam "presos" ou "perdidos" na rua (com state \= 0\) após a queda ou reinicialização do servidor, impedindo os jogadores de retirá-los nas garagens.

## **Funcionalidades**

* **Correção Automática no Boot:** Assim que o recurso é iniciado (durante o startup/restart do servidor), ele altera o estado de todos os veículos de 0 (fora da garagem) para 1 (guardado).  
* **Comando Manual:** Permite que administradores forcemos a execução da rotina a qualquer momento através do comando /fixgaragem.  
* **Otimizado:** Utiliza apenas uma query direta via oxmysql, garantindo impacto zero na performance do servidor.

## **Dependências**

* oxmysql

## **Instalação**

1. Faça o download ou clone este repositório.  
2. Extraia a pasta para o diretório de scripts do seu servidor, recomendável dentro de:  
   `[addons]/[scripts]/adcr_fixgaragem`

3. Certifique-se de que o script seja iniciado **após** o oxmysql no seu server.cfg:  
   `ensure oxmysql`  
   `ensure adcr_fixgaragem`

## **Comandos disponíveis**

* /fixgaragem: Executa a query de atualização do estado dos veículos manualmente (Pode ser executado tanto pelo console do servidor quanto por um jogador in-game).

## **Estrutura do Banco de Dados**

O script assume o padrão estrutural do QBCore/QBox na tabela player\_vehicles:

* state \= 0: Veículo na rua/perdido.  
* state \= 1: Veículo guardado na garagem.

**Autor:** Jhon Parzival  
**Versão:** 1.0.0