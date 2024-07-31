# Explorart

## Pontos sobre o projeto

- [Projeto](#projeto)
- [Funcionalidades](#funcionalidades)

## Projeto

O projeto consiste em um app para explorar arte, utilizando a API pública do Instituto de Arte de Chicago [ARTIC](https://api.artic.edu/docs/#introduction). Nele é possível conhecer uma obra de arte nova por dia, bem como explorar uma lista de tours com link para agendamento. Pontos importantes:
- A arquitura utilizada foi MVVM com Coodinator para a navegação
- Desenvolvida uma estrutura inicial de um DesignSystem com Foundation e Components
- Padrão para camada de Networking com API e Service
- Demonstra a integração de UIKit com SwiftUI em uma das telas
- Para a Home, foram criados testes unitários, com classes de Mocks, Doubles e Fixtures

## Funcionalidades

- Home

Uma tela onde é possível visualizar uma arte nova todos os dias, bem como navegar para o site oficial do ARTIC. A arte do dia é "simulada" com a primeira arte retornada da listagem, isso se deve ao fato da API não possuir um endpoint de arte randômica. Por conta do padrão de imagem enviado, não foi possível utilizar a API para esse caso, a falta de um link que leva direto a obra também não permitiu que o botão de "Mais informações" leve direto para a obra.

A também serve de exemplo para os padrões de testes unitários, visando cobrir todos os métodos da HomeViewModel.

<p float="left">
  <img src="https://github.com/user-attachments/assets/c2f34df2-2c7c-438c-9fed-8b99dc987cee" width="300" />
</p>

- Tours

A tela de Tours consiste em uma listagem de tours de arte disponíveis na API do ARTIC, listando os dados enviados pelo endpoint, com imagem e título. A navegação para um dos tours leva a uma tela com informações mais detalhadas sobre o tour, bem como um botão que leva diretamente ao site do ARTIC. A tela de detalhes foi desenvolvida em SwiftUI, visando demonstrar e documentar a utilização de SwiftUI juntamente com UIKit.

<p float="left">
  <img src="https://github.com/user-attachments/assets/721881c8-b2e0-4da3-964c-dc7e3a3bbb86" width="300" />
</p>
