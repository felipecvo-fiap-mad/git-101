# Desafio Git

Neste desafio, você será introduzido ao `git`, uma ferramenta essencial para acompanhar mudanças no código e colaborar em projetos. O objetivo é você se familiarizar com o fluxo básico de trabalho no `git`, fazer commits, rastrear mudanças e trabalhar com __branches__. Ao final, você estará preparado para gerenciar versões do seu código e colaborar de forma eficaz.

Após concluir cada tarefa, não se esqueça de enviar suas alterações para o repositório remoto (`origin`). Use o comando apropriado para garantir que todas as mudanças feitas localmente sejam refletidas no repositório compartilhado.

## Configuração

```
git remote add template https://github.com/felipecvo-fiap-mad/git-101.git
git fetch template
git reset --hard template/main
git push --force
git push origin --tags "refs/remotes/template/*:refs/heads/*"
git remote remove template
```

## Tarefa 1

Sua primeira tarefa é criar um commit na branch principal do projeto. Para isso, você precisará adicionar um novo arquivo ao repositório e também editar um arquivo existente, incluindo ambas as mudanças no mesmo commit.

### Requisitos

- Criar um arquivo `melhor-curso.md` na raiz.
  - Em uma linha adiciona o nome do melhor curso de tecnologia na sua opinião.
  - Em outra linha, adicione o nome da instituição onde ele é ministrado.

- Editar o arquivo `melhor-disciplina.md` existente no repositório.
  - Coloque o nome da melhor disciplina, na sua opinião.

- Fazer o commit dessas alterações com uma mensagem clara e descritiva na branch principal.

## Tarefa 2

Na segunda tarefa, você deve entrar na branch `systeminfo`, onde o arquivo `get_system_info.bat` já está disponível. Depois, execute o script para gerar as informações do sistema. Em seguida, adicione o arquivo gerado ao repositório e faça um commit dessas alterações.

### Requisitos

- Mudar para a branch `systeminfo` usando o `git`.
- Executar o script `get_system_info.bat` para gerar os arquivos `systeminfo.txt` e `execution.log`.
- Adicionar o arquivo `systeminfo.txt` ao controle de versão.
- Criar um commit com uma mensagem descritiva na branch `systeminfo`.
- Ignorar o arquivo `execution.log` no repositório.

## Tarefa 3

Nesta tarefa, você deverá usar os comandos `git` para reunir informações específicas sobre o histórico de commits e autoria de mudanças.

### Requisitos:

- Mudar para a branch `who-else`.
- Criar um arquivo chamado `sherlock.txt` com as seguintes informações, cada uma em uma linha:
  - Quantos commits existem nesta branch.
  - O nome do arquivo alterado no commit `A Long-expected Party`.
  - Quem alterou a linha `5` do arquivo `slovakia.md`.
- Adicionar o arquivo `sherlock.txt` ao repositório.
- Criar um commit com uma mensagem descritiva na branch `who-else`.

## Tarefa 4

Para esta tarefa, você deve integrar as mudanças da branch `chapter1` na branch `book`.

### Requisitos

- Mudar para a branch `book`.
- Realizar o merge da branch `chapter1` na branch `book`.
- Resolver qualquer conflito que possa surgir durante o merge.
- Garantir que o merge foi concluído com sucesso e que a branch `book` contém todas as mudanças da branch `chapter1`.

## Tarefa 5

Você precisa realizar um merge da branch `comments` na branch `chapter2`. Durante o processo, haverá um conflito que deve ser resolvido para que as alterações da branch `chapter2` prevaleçam sobre as alterações da branch `comments`.

### Requisitos

- Mudar para a branch `chapter2`.
- Realizar o merge da branch comments na branch `chapter2`.
- Resolver o conflito mantendo as alterações da branch `chapter2` e sobrescrevendo as alterações da branch `comments`.
- Verificar se o merge foi concluído com sucesso e que a branch `chapter2` reflete as mudanças desejadas.

## Tarefa 6

Agora você precisará desfazer uma alteração que foi realizada anteriormente. Para isso, você irá reverter um commit específico para restaurar o estado do projeto antes da alteração.

### Requisitos

- Mudar para a branch `daring`
- Identificar o commit que contém a alteração a ser revertida: `Revise story paragraph to reflect Sauron's dark influence in the digital realm`.
- Reverta a alteração mantendo o histórico das alterações.
- Verifique se a alteração foi desfeita corretamente e que o estado do projeto foi restaurado.

## Tarefa 7

Você precisa restaurar um arquivo da branch `chapter3` e trazê-lo para a branch `chapter4`. O objetivo é garantir que o arquivo da branch `chapter3` seja corretamente restaurado e incluído na branch `chapter4`.

### Requisitos

- Mudar para a branch `chapter4`.
- Utilizar o comando apropriado para restaurar o arquivo `chapter3.md` da branch `chapter3` para a branch `chapter4`.
- Verificar se o arquivo foi restaurado corretamente e contém o conteúdo da branch `chapter3`.
- Adicionar o arquivo restaurado ao controle de versão.
- Criar um commit com uma mensagem descritiva para registrar a restauração do arquivo.

## Tarefa 8

Você precisa resetar todas as alterações realizadas na branch `feature` para que ela reflita a versão remota da branch `main`. O objetivo é garantir que a branch `feature` seja restaurada para o estado exato da branch remota `main`, descartando todas as mudanças feitas na `feature`.

### Requisitos

- Mudar para a branch `feature`.
- Utilizar o comando apropriado para resetar a branch `feature` para a versão remota da branch `main`.
- Garantir que todas as alterações na branch `feature` sejam descartadas e que a branch reflita exatamente o estado da branch remota `main`.
