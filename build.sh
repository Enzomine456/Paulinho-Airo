#!/bin/bash

# Configuração de cores para mensagens
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Iniciando processo de build para Netlify...${NC}"

# Criar diretório public
mkdir -p public

# Criar arquivo index.html principal
echo -e "${YELLOW}Criando página principal...${NC}"
cat > public/index.html << 'EOL'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paulo Roberto AI - Assistente Inteligente</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
            color: white;
        }

        .header h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .main-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 40px;
        }

        .chat-section, .features-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .chat-section h2, .features-section h2 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 1.8rem;
        }

        .chat-container {
            height: 400px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            overflow-y: auto;
            margin-bottom: 20px;
            background: #f9f9f9;
        }

        .message {
            margin-bottom: 15px;
            padding: 10px 15px;
            border-radius: 10px;
            max-width: 80%;
        }

        .user-message {
            background: #667eea;
            color: white;
            margin-left: auto;
        }

        .ai-message {
            background: #e8f4fd;
            color: #333;
            border-left: 4px solid #667eea;
        }

        .input-group {
            display: flex;
            gap: 10px;
        }

        #userInput {
            flex: 1;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s;
        }

        #userInput:focus {
            border-color: #667eea;
        }

        .send-btn {
            padding: 12px 24px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }

        .send-btn:hover {
            background: #5a6fd8;
        }

        .send-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        .feature-list {
            list-style: none;
        }

        .feature-list li {
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }

        .feature-list li:last-child {
            border-bottom: none;
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            background: #667eea;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: white;
            font-weight: bold;
        }

        .feature-text {
            flex: 1;
        }

        .feature-text h3 {
            color: #333;
            margin-bottom: 5px;
        }

        .feature-text p {
            color: #666;
            font-size: 0.9rem;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .quick-btn {
            padding: 15px;
            background: #f8f9fa;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            transition: all 0.3s;
            text-decoration: none;
            color: #333;
        }

        .quick-btn:hover {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }

        .footer {
            text-align: center;
            color: white;
            margin-top: 40px;
            opacity: 0.8;
        }

        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }
            
            .header h1 {
                font-size: 2rem;
            }
        }

        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid #f3f3f3;
            border-top: 3px solid #667eea;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🤖 Paulo Roberto AI</h1>
            <p>Seu assistente inteligente para criação de documentos e processamento de linguagem natural</p>
        </div>

        <div class="main-content">
            <div class="chat-section">
                <h2>💬 Conversa com IA</h2>
                <div class="chat-container" id="chatContainer">
                    <div class="message ai-message">
                        Olá! Sou o Paulo Roberto AI. Como posso ajudá-lo hoje? 
                        Posso criar apresentações, planilhas, analisar textos e muito mais!
                    </div>
                </div>
                <div class="input-group">
                    <input type="text" id="userInput" placeholder="Digite sua mensagem..." onkeypress="handleKeyPress(event)">
                    <button class="send-btn" onclick="sendMessage()" id="sendBtn">Enviar</button>
                </div>
                
                <div class="quick-actions">
                    <div class="quick-btn" onclick="quickAction('Criar uma apresentação sobre inteligência artificial')">
                        📊 Criar Apresentação
                    </div>
                    <div class="quick-btn" onclick="quickAction('Gerar uma planilha de vendas')">
                        📈 Criar Planilha
                    </div>
                    <div class="quick-btn" onclick="quickAction('Analisar o sentimento deste texto: Estou muito feliz com os resultados!')">
                        😊 Análise de Sentimento
                    </div>
                </div>
            </div>

            <div class="features-section">
                <h2>🚀 Funcionalidades</h2>
                <ul class="feature-list">
                    <li>
                        <div class="feature-icon">📊</div>
                        <div class="feature-text">
                            <h3>Criação de Apresentações</h3>
                            <p>Gere apresentações PowerPoint profissionais automaticamente</p>
                        </div>
                    </li>
                    <li>
                        <div class="feature-icon">📈</div>
                        <div class="feature-text">
                            <h3>Planilhas Excel</h3>
                            <p>Crie planilhas complexas com dados estruturados</p>
                        </div>
                    </li>
                    <li>
                        <div class="feature-icon">🧠</div>
                        <div class="feature-text">
                            <h3>Processamento de Linguagem Natural</h3>
                            <p>Análise de sentimentos e extração de entidades</p>
                        </div>
                    </li>
                    <li>
                        <div class="feature-icon">🔍</div>
                        <div class="feature-text">
                            <h3>Análise de Texto</h3>
                            <p>Identificação de padrões e insights em documentos</p>
                        </div>
                    </li>
                    <li>
                        <div class="feature-icon">⚡</div>
                        <div class="feature-text">
                            <h3>Resposta Rápida</h3>
                            <p>Processamento em tempo real com interface intuitiva</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="footer">
            <p></p>
        </div>
    </div>

    <script>
        let isProcessing = false;

        function handleKeyPress(event) {
            if (event.key === 'Enter' && !isProcessing) {
                sendMessage();
            }
        }

        function quickAction(text) {
            document.getElementById('userInput').value = text;
            sendMessage();
        }

        function addMessage(text, isUser = false) {
            const chatContainer = document.getElementById('chatContainer');
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${isUser ? 'user-message' : 'ai-message'}`;
            messageDiv.textContent = text;
            chatContainer.appendChild(messageDiv);
            chatContainer.scrollTop = chatContainer.scrollHeight;
        }

        function setLoading(loading) {
            const sendBtn = document.getElementById('sendBtn');
            const userInput = document.getElementById('userInput');
            
            isProcessing = loading;
            sendBtn.disabled = loading;
            userInput.disabled = loading;
            
            if (loading) {
                sendBtn.innerHTML = '<span class="loading"></span>';
            } else {
                sendBtn.textContent = 'Enviar';
            }
        }

        function generateAIResponse(userInput) {
            const input = userInput.toLowerCase();
            
            // Simular processamento de IA
            if (input.includes('apresentação') || input.includes('powerpoint') || input.includes('ppt')) {
                return `📊 Apresentação criada com sucesso!
                
Título: Apresentação sobre ${input.includes('inteligência artificial') ? 'Inteligência Artificial' : 'Tema Específico'}

Slides gerados:
1. Slide de Título
2. Introdução
3. Desenvolvimento
4. Conclusão

A apresentação foi salva como "apresentacao_${Date.now()}.pptx"`;
            }
            
            if (input.includes('planilha') || input.includes('excel') || input.includes('xlsx')) {
                return `📈 Planilha criada com sucesso!
                
Nome do arquivo: planilha_${Date.now()}.xlsx

Colunas incluídas:
- Nome
- Idade  
- Cidade
- Valor

Dados de exemplo foram adicionados automaticamente.`;
            }
            
            if (input.includes('sentimento') || input.includes('análise')) {
                const sentiment = input.includes('feliz') || input.includes('ótimo') || input.includes('excelente') 
                    ? 'Positivo 😊' 
                    : input.includes('triste') || input.includes('ruim') || input.includes('péssimo')
                    ? 'Negativo 😔'
                    : 'Neutro 😐';
                
                return `😊 Análise de Sentimento:
                
Texto analisado: "${userInput}"
Sentimento detectado: ${sentiment}
Confiança: 85%

Entidades encontradas:
- Emails: ${(userInput.match(/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g) || []).length}
- Nomes próprios: ${(userInput.match(/[A-Z][a-z]+ [A-Z][a-z]+/g) || []).length}`;
            }
            
            if (input.includes('olá') || input.includes('oi') || input.includes('hello')) {
                return `Olá! 👋 Como posso ajudá-lo hoje? 

Posso:
• Criar apresentações PowerPoint
• Gerar planilhas Excel  
• Analisar sentimentos em textos
• Processar documentos
• Responder perguntas gerais

Basta me dizer o que você precisa!`;
            }
            
            // Resposta padrão
            return `Entendi sua solicitação: "${userInput}"

Estou processando sua requisição e gerando uma resposta personalizada. 

💡 Dica: Você pode me pedir para:
- "Criar uma apresentação sobre marketing digital"
- "Gerar uma planilha de controle financeiro" 
- "Analisar o sentimento deste texto: [seu texto aqui]"

Como posso ajudá-lo de forma mais específica?`;
        }

        async function sendMessage() {
            const userInput = document.getElementById('userInput');
            const message = userInput.value.trim();
            
            if (!message || isProcessing) return;
            
            // Adicionar mensagem do usuário
            addMessage(message, true);
            userInput.value = '';
            
            // Mostrar loading
            setLoading(true);
            
            // Simular processamento
            setTimeout(() => {
                const aiResponse = generateAIResponse(message);
                addMessage(aiResponse);
                setLoading(false);
            }, 1000 + Math.random() * 2000); // Delay aleatório entre 1-3 segundos
        }

        // Adicionar mensagem de boas-vindas inicial
        setTimeout(() => {
            addMessage(`Bem-vindo ao Paulo Roberto AI! 🎉

Estou aqui para ajudá-lo com:
• 📊 Criação de apresentações
• 📈 Geração de planilhas  
• 🧠 Análise de textos
• 💬 Processamento de linguagem natural

Experimente fazer uma pergunta ou usar os botões de ação rápida!`);
        }, 2000);
    </script>
</body>
</html>
EOL

# Criar arquivo de configuração para Netlify
echo -e "${YELLOW}Criando configurações do Netlify...${NC}"
cat > public/_redirects << 'EOL'
/*    /index.html   200
EOL

# Criar arquivo de cabeçalhos para segurança
cat > public/_headers << 'EOL'
/*
  X-Frame-Options: DENY
  X-XSS-Protection: 1; mode=block
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
EOL

# Criar arquivo robots.txt para SEO
echo -e "${YELLOW}Criando arquivo robots.txt...${NC}"
cat > public/robots.txt << 'EOL'
User-agent: *
Allow: /

Sitemap: https://your-site-name.netlify.app/sitemap.xml
EOL

# Criar web manifest para PWA
echo -e "${YELLOW}Criando web manifest...${NC}"
cat > public/site.webmanifest << 'EOL'
{
  "name": "Paulo Roberto AI",
  "short_name": "Paulo AI",
  "description": "Assistente inteligente para criação de documentos e processamento de linguagem natural",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#667eea",
  "theme_color": "#667eea",
  "icons": [
    {
      "src": "/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
EOL

echo -e "${GREEN}Build concluído com sucesso!${NC}"
echo -e "${YELLOW}Arquivos gerados em: public/${NC}"
