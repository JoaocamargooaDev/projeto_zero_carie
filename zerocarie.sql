CREATE DATABASE IF NOT EXISTS zerocarie;
USE zerocarie;

-- ESCOLAS: precisa ter colunas id, name, city
CREATE TABLE escolas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    endereco VARCHAR(255),    -- campo extra opcional, front não usa (ainda)
    contato VARCHAR(255)      -- idem
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- TURMAS: id, name, schoolId
CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    schoolId INT,
    FOREIGN KEY (schoolId) REFERENCES escolas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CRIANCAS: id, name, birthDate, guardian, schoolId, classId
CREATE TABLE criancas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthDate DATE NULL,
    guardian VARCHAR(255),           -- nome do responsável
    guardian_contact VARCHAR(255),   -- contato opcional
    schoolId INT,
    classId INT,
    FOREIGN KEY (schoolId) REFERENCES escolas(id) ON DELETE CASCADE,
    FOREIGN KEY (classId) REFERENCES turmas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ESCOVACAO: id, childId, datetime, supervisor, photoUrl, notes
CREATE TABLE escovacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    childId INT,
    datetime DATETIME NOT NULL,
    supervisor VARCHAR(255),
    photoUrl VARCHAR(255),  -- URL/caminho da foto
    notes TEXT,
    FOREIGN KEY (childId) REFERENCES criancas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM escolas;
SELECT * FROM turmas;
SELECT * FROM criancas;
SELECT * FROM escovacao;
