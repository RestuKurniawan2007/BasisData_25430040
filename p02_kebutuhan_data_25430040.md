**Dokumen Kebutuhan Data - Klinik Restu Farma (RF)**



**1. Latar Belakang dan Lingkup Layanan**



&#x09;Klinik Restu Farma (RF) adalah fasilitas pelayanan kesehatan yang menyediakan layanan pemeriksaan umum, tindakan medis dasar, pemeriksaan laboratorium sederhana, serta pengelolaan farmasi (apotek). Kebutuhan akan sistem basis data yang terstruktur diperlukan untuk mengelola data rekam medis pasien, riwayat kunjungan, transaksi tindakan, serta pengontrolan persediaan obat.



**2. Aktor dan Proses Bisnis**



|***kode***|***Proses Bisnis***|***Aktor***|***Pemicu***|
|-|-|-|-|
|PB-01|Pendaftarkan Pasien Baru|Resepsionis|Pasien baru datang berobat|
|PB-02|Mencatat Rekam Medis \& Tindakan|Dokter|Pasien masuk ruang pemeriksaan|
|PB-03|Pengelolaan Stok \& Resep Obat|Apoteker|Dokter memberikan resep / stok menipis|
|PB-04|Pembayaran Layanan \& Obat|Kasir|Pasien selesai mendapatkan layanan|
|PB-05|Penyusunan Laporan Bulanan|kepala Klinik|Memasuki awal bulan|





**3. Dokumen Sumber yang Dianalisis**



* Dokumen		:Lembar Rekam Medis \& Struk Pembayaran Klinik.
* Elemen Disimpan	:Nomor Kunjungan, Waktu Transaksi, Identitas Pasien, Dokter Pemeriksa, Jenis Tindakan, serta Daftar Obat beserta kuantitas dan harga saat transaksi.
* Nilai Turunan	: Subtotal biaya obat dan Total tagihan keseluruhan.



**4. Entitas Kandidat dan Atribut Utama**



* Pasien		:No Rekam Medis, NIK, Nama Lengkap, Nomor HP.
* Petugas		:ID Petugas, Nama, Peran (Dokter/Kasir/Apoteker).
* Obat			:Kode Obat, Nama Obat, Kategori, Harga Jual, Stok.
* Kunjungan		:Nomor Kunjungan, Tanggal, ID Pasien, ID Dokter, Keluhan.
* Detail Tindakan	:Nomor Kunjungan, Nama Tindakan, Biaya Tindakan.
* Detail Resep		:Nomor Kunjungan, Kode Obat, Kuantitas (Qty), Harga Satuan.



**5. Aturan Bisnis (AB)**



|***Kode***|***Aturan Bisnis***|
|-|-|
|AB-01|Setiap kunjungan memiliki nomor transaksi yang unik dan ditangani oleh satu dokter penanggung jawab.|
|AB-2|Stok obat tidak boleh bernilai negatif; transaksi penebusan obat akan ditolak jika kuantitas melebihi stok tersedia.|
|AB-03|Batas maksimal obat yang dapat diresepkan dalam satu kunjungan adalah 7 jenis obat.|
|AB-04|Pasien dengan kriteria khusus/program tertentu berhak mendapatkan potongan diskon layanan sebesar 5 persen.|
|AB-05|Harga obat pada detail resep dicatat per baris transaksi dan bersifat tetap, tidak berubah meskipun harga master obat mengalami kenaikan di masa mendatang.|
|AB-06|Nomor Induk Kependudukan (NIK) pasien bersifat unik dan wajib diisi untuk menghindari duplikasi data.|
|AB-07|Sistem harus mencatat pengadaan ulang jika stok obat berada di bawah batas minimum.|
|AB-08|pelayanan kunjungan dapat berupa tindakan medis murni tanpa harus disertai penebusan resep obat.|





**6. Kebutuhan Informasi (KI)**



|***Kode***|***Kebutuhan Informasi/Laporan***|***Sumber Data Terkait***|
|-|-|-|
|KI-01|Rekapitulasi omzet dan jumlah kunjungan per hari/bulan|Kunjungan, Detail Resep, Detail Tindakan|
|KI-02|Daftar 5 obat yang paling sering diresepkan|Obat, Detail Resep|
|KI-03|Daftar obat di apotek yang sudah mencapai batas minimum|Obat|
|KI-04|Laporan pasien dengan total akumulasi tagihan terbesar|Pasien, Kunjungan, Detail Obat|
|KI-05|Rekapitulasi jenis tindakan medis/lab yang sering digunakan|Detail Tindakan|





**7. Matriks CRUD**



* C (Create): Menambahkan data baru.
* R (Read): Melihat atau membaca data.
* U (Update): Mengubah data.
* D (Delete): Menghapus data.
* –: Tidak memiliki hak akses pada data tersebut.



|***Proses Bisnis***|***Pasien***|***Petugas***|***Obat***|***Kunjungan***|***Detail Tindakan***|***Detail Resep***|
|-|-|-|-|-|-|-|
|PB-01|C, R|-|-|-|-|-|
|PB-02|R, U|R|-|C|C|-|
|PB-03|-|-|R, U|R|-|C|
|PB-04|R|R|R|U|R|R|
|PB-05|R|R|R|R|R|R|





**8. Kamus Data Awal**



|***Nama Elemen***|***Deskripsi***|***Contoh Nilai***|***Aturan***|***Penanggung Jawab***|
|-|-|-|-|-|
|No rm|Nomer Rekaman Medis Pasien|RM-0012|Unik, Format Tetap|Resepsionis|
|NIK|Nomer Induk Kependudukan|1234567890123456|Unik  16 Digit|Resepsionis|
|Nama Pasien|Nma Lengkap Pasien|Restu Kurniawan|Wajib Diisi|Resepsionis|
|Kode Obat|Kode Indentifikasi Obat|OB-001|Unik|Resepsionis|
|Stok Obat|Jumah Ketersedian Stok|50|Bilangan Bulat|Apoteker|
|No Kunjungan|Nomer Kunjungan|KJ-1001|Unit Pertranskasi|Resepsionis|
|Quantity Resep|Jumlah Obat Yang DItebus|2|Maksimal 7 (P+2)|Apoteker|





**9. Kebutuhan Non-Fungsional dan Aspek Privasi**



* Parameter Proyek		:Berdasarkan NIM 25430040, diperoleh nilai parameter P yaitu 5.
* Volume Transaksi		:Diperkirakan melayani sekitar 65 kunjungan pasien per hari. Arsip data rekam medis disimpan sekurang-kurangnya selama 5 tahun.
* Privasi dan Keamanan Data	:NIK, nomor kontak, riwayat keluhan, serta diagnosis medis dikategorikan sebagai data pribadi spesifik. Akses data klinis ini dibatasi secara ketat dan hanya boleh diakses oleh Dokter serta Apoteker yang berwenang.

