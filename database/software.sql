CREATE DATABASE escolaMusical()


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    status ENUM('ativo', 'inativo') NOT NULL, #Ou Bollean
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
)


CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT NOT NULL,
    valor_mensalidade DECIMAL(10,2),
    telefone VARCHAR(20) NOT NULL,
    observacoes TEXT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    atualizado_em DATETIME,

    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
)


CREATE TABLE professores (
    id_professores INT AUTO_INCREMENT PRIMARY KEY,
    cor VARCHAR(7) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    especialidade ENUM('Violino', 'Violoncelo'), #Ver outra forma
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
)


CREATE TABLE pagamentos (
    id_pagamentos INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_professor INT,
    mes_referencia INT, #
    ano_referencia INT, #
    valor_pago DECIMAL(10,2),
    data_pagamento DATETIME,
    forma_pagamento ENUM('PIX', 'DEBITO', 'CREDITO', 'DINHEIRO') NOT NULL,
    status ENUM('pago', 'pendente', 'cancelado') NOT NULL, #Ou Bollean,
    observacoes TEXT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
)


# CREATE TABLE comprovantes_pagamento

CREATE TABLE configuracoes_escola (
    id_escola INT AUTO_INCREMENT PRIMARY KEY,
    nome_instituicao VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255)  NOT NULL,
    valor DECIMAL(10,2),
    dia_vencimento INT NOT NULL,
    logo_url VARCHAR(255),
    observacao_comprovante TEXT
)

CREATE TABLE salas (
    id_salas INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    numero INT,
    status ENUM('ativo', 'inativo') NOT NULL, #Ou Bollean,
    observacoes TEXT
)


CREATE TABLE reserva_salas (
    id_reserva_salas INT AUTO_INCREMENT PRIMARY KEY,
    id_salas INT NOT NULL, 
    id_professor INT NOT NULL,
    id_aluno INT NOT NULL,
    dia_semana ENUM('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    status ENUM('Reservado', 'Cancelado', 'Concluído') NOT NULL,
    observacoes TEXT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_salas) REFERENCES salas(id_salas),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
)
