# 🤖 Paulo Roberto AI

Um assistente inteligente especializado em criação de documentos e processamento de linguagem natural, desenvolvido como uma aplicação web moderna.

## 🚀 Funcionalidades

- **📊 Criação de Apresentações**: Gera apresentações PowerPoint profissionais automaticamente
- **📈 Planilhas Excel**: Cria planilhas complexas com dados estruturados
- **🧠 Processamento de Linguagem Natural**: Análise de sentimentos e extração de entidades
- **🔍 Análise de Texto**: Identificação de padrões e insights em documentos
- **⚡ Interface Intuitiva**: Chat interativo com respostas em tempo real

## 🛠️ Tecnologias Utilizadas

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Design**: Interface responsiva com gradientes modernos
- **Deploy**: Netlify (Plataforma de hospedagem estática)
- **Build**: Script bash automatizado

## 📱 Interface

A aplicação apresenta uma interface moderna com:

- **Chat Interativo**: Conversa em tempo real com a IA
- **Ações Rápidas**: Botões para tarefas comuns
- **Design Responsivo**: Funciona em desktop e mobile
- **Animações**: Transições suaves e feedback visual

## 🚀 Como Usar

1. **Acesse a aplicação**: Abra o site no seu navegador
2. **Digite sua solicitação**: Use o campo de texto para fazer perguntas
3. **Use ações rápidas**: Clique nos botões para tarefas específicas
4. **Receba respostas**: A IA processa e responde automaticamente

### Exemplos de Comandos

- "Criar uma apresentação sobre inteligência artificial"
- "Gerar uma planilha de vendas"
- "Analisar o sentimento deste texto: Estou muito feliz com os resultados!"

## 🏗️ Estrutura do Projeto

```
Paulinho Airo/
├── build.sh          # Script de build para Netlify
├── main.cpp          # Código C++ original (não usado no deploy)
├── netlify.toml      # Configuração do Netlify
├── README.md         # Este arquivo
└── public/           # Arquivos gerados pelo build
    ├── index.html    # Página principal
    ├── _redirects    # Configuração de redirecionamentos
    └── _headers      # Cabeçalhos de segurança
```

## 🔧 Desenvolvimento Local

Para executar localmente:

```bash
# Dar permissão de execução ao script
chmod +x build.sh

# Executar o build
./build.sh

# Abrir o arquivo gerado
open public/index.html
```

## 🌐 Deploy

O projeto está configurado para deploy automático no Netlify:

1. **Build Command**: `chmod +x build.sh && ./build.sh`
2. **Publish Directory**: `public`
3. **Redirects**: Configurados para SPA (Single Page Application)

## 🎨 Características do Design

- **Paleta de Cores**: Gradiente azul-roxo moderno
- **Tipografia**: Segoe UI para melhor legibilidade
- **Layout**: Grid responsivo com duas colunas
- **Interatividade**: Hover effects e animações CSS
- **Acessibilidade**: Contraste adequado e navegação por teclado

## 📊 Funcionalidades da IA

### Análise de Sentimentos
- Detecta sentimentos positivos, negativos e neutros
- Análise baseada em palavras-chave
- Confiança calculada automaticamente

### Geração de Documentos
- **Apresentações**: Estrutura automática com slides
- **Planilhas**: Colunas e dados de exemplo
- **Formatação**: Arquivos prontos para download

### Processamento de Texto
- **Tokenização**: Quebra de texto em palavras
- **Extração de Entidades**: Nomes, emails, etc.
- **Cache Inteligente**: Respostas otimizadas

## 🔒 Segurança

- **Headers de Segurança**: Configurados no `_headers`
- **XSS Protection**: Proteção contra ataques XSS
- **Content Type**: Headers de segurança adequados
- **Referrer Policy**: Política de referência restritiva

## 📈 Roadmap

- [ ] Integração com APIs de IA reais
- [ ] Sistema de autenticação
- [ ] Histórico de conversas
- [ ] Exportação de documentos
- [ ] Múltiplos idiomas
- [ ] Modo escuro/claro

## 🤝 Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Faça um fork do projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 👨‍💻 Autor

**Paulo Roberto AI** - Desenvolvido com inteligência artificial

---

⭐ Se este projeto foi útil, considere dar uma estrela! 