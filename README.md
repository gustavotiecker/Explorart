# Explorart

## Pontos sobre o projeto

- [Projeto](#projeto)
- [Funcionalidades](#funcionalidades)

## Ideia

O projeto consiste em um app para explorar arte, utilizando a API pública do Instituto de Arte de Chicago [ARTIC](https://api.artic.edu/docs/#introduction). Nele é possível conhecer uma obra de arte nova por dia, bem como explorar uma lista de tours com link para agendamento. Pontos importantes:
- A arquitura utilizada foi MVVM com Coodinator para a navegação
- Desenvolvida uma estrutura inicial de um DesignSystem com Foundation e Components
- Padrão para camada de Networking com API e Service
- Demonstra a integração de UIKit com SwiftUI em uma das telas
- Para a Home, foram criados testes unitários, com classes de Mocks, Doubles e Fixtures

## Features

- Feature 1

Consiste em uma tela onde é possível visualizar uma arte nova todos os dias, bem como navegar para o site oficial da ARTIC. Por conta do padrão de imagem enviado, não foi possível utilizar a API para esse caso, a falta de um link que leva direto a obra também não permitiu que o botão de "Mais informações" leve direto para a obra. a Home conta com:

<p float="left">
  <img src="https://github.com/user-attachments/assets/c2f34df2-2c7c-438c-9fed-8b99dc987cee" width="300" />
</p>

- Feature 2
- Feature 3
