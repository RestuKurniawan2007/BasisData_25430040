Password sengaja diganti penanda. JANGAN commit password asli.
Ganti <password_kerja>, <password_dev>, dan <password_tamu> saat menjalankan di komputer sendiri.
Skrip dapat dijalankan berulang kali: mysql -u root -p 

1.Basis data praktikum dan akun kerja (studi kasus Kopma)
CREATE DATABASE IF NOT EXISTS kopma_040
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mhs_040'@'localhost' IDENTIFIED BY '<password_kerja>';
GRANT ALL PRIVILEGES ON kopma_040.* TO 'mhs_040'@'localhost';

2. Milestone Proyek 1: basis data dan akun developer proyek Klinik Restu Farma
CREATE DATABASE IF NOT EXISTS klinik_040
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'dev_040'@'localhost' IDENTIFIED BY '<password_dev>';
GRANT ALL PRIVILEGES ON klinik_040.* TO 'dev_040'@'localhost';

3. Latihan: akun tamu yang hanya boleh SELECT pada kopma_040 (memicu galat 1142 saat CREATE TABLE)
CREATE USER IF NOT EXISTS 'tamu_040'@'localhost' IDENTIFIED BY '<password_tamu>';
GRANT SELECT ON kopma_040.* TO 'tamu_040'@'localhost';

4. Verifikasi hak akses
SHOW GRANTS FOR 'mhs_040'@'localhost';
SHOW GRANTS FOR 'dev_040'@'localhost';
SHOW GRANTS FOR 'tamu_040'@'localhost';
