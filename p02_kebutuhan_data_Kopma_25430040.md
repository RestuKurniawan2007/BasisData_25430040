**Dokumen Kebutuhan Data - Koperasi Mahasiswa Sejahtera (Kopma)**



**1. Latar Belakang dan Aktivitas Organisasi**



&#x09;Koperasi Mahasiswa Sejahtera (Kopma) bergerak di bidang penjualan kebutuhan kampus seperti alat tulis, makanan ringan, dan minuman. Transaksi selama ini dicatat secara manual menggunakan buku tulis dan spreadsheet, yang sering memicu kendala seperti kesalahan pencatatan stok dan hilangnya riwayat harga. Oleh karena itu, dibutuhkan perancangan basis data operasional yang andal.



**2. Aktor dan Proses Bisnis**



|***Kode***|***proses Bisnis***|***Aktor***|***Pemicu***|
|-|-|-|-|
|PB-01|Mendaftarkan Anggota Baru|Kasir|Mahasiswa Mengajukan Pendaftaran Keangggotaan|
|PB-02|Mencatat Transaksi Penjualan|Kasir|Pembeli melakukan pembayaran di kasir|
|PB-03|Memesan Barang ke Pemasok|Petugas Gudang|Stok barang di bawah batas minimum|
|PB-03|Menerima Barang Dari Pemasok|Petugas Gudang|Kiriman barang dan faktur tiba di gudang|
|PB-03|Menyusun Laporan Bulanan|Ketua Koprasi|Memasuki awal bulan periode pelaporan|





**3. Dokumen Sumber yang Dianalisis**



* Dokumen			:Nota Penjualan Kopma.
* Elemen Disimpan		:Nomor Nota, Tanggal dan Waktu Transaksi, Kasir yang Bertugas, Identitas Anggota, serta Rincian Barang, Kuantitas, dan Harga Satuan saat transaksi.
* Nilai Turunan (Dihitung)	:Subtotal per item, Diskon Anggota, Total Belanja, serta Uang Kembalian.



**4. Entitas Kandidat dan Atribut Utama**



1. Anggota		: Nomor Anggota, NIM, Nama, Program Studi, Nomor HP, Status Aktif.
2. Barang		: Kode Barang, Nama Barang, Kategori, Harga Jual, Stok, Batas Minimum Stok.
3. Penjualan		: Nomor Nota, Tanggal dan Waktu, ID Petugas, ID Anggota, Jumlah Bayar.
4. Detail Penjualan	: Nomor Nota, Kode Barang, Kuantitas, Harga Satuan Transaksi.
5. Petugas		: Kode Petugas, Nama Lengkap, Peran.
6. Pemasok		: Kode Pemasok, Nama Pemasok, Telepon, Alamat.
7. Pembelian		: Nomor Faktur, Tanggal Pembelian, ID Pemasok.
8. Detail Pembelian	: Nomor Faktur, Kode Barang, Kuantitas, Harga Beli.



**5. Aturan Bisnis (AB)**



|***Kode***|***Aturan Bisnis***|
|-|-|
|AB-01|Setiap nota penjualan wajib memiliki nomor unik dan memuat minimal satu baris rincian barang.|
|AB-02|Transaksi penjualan diperbolehkan tanpa data anggota. Jika menggunakan keanggotaan, status wajib aktif untuk memperoleh diskon 5%.|
|AB-02|Persediaan stok barang tidak boleh bernilai negatif. Sistem harus menolak transaksi jika kuantitas melebihi stok yang tersedia.|
|AB-04|Harga jual pada rincian nota disimpan secara spesifik per baris transaksi dan tidak berubah meskipun harga master barang mengalami kenaikan di kemudian hari.|
|AB-05|Nomor Induk Mahasiswa (NIM) anggota bersifat unik dan menjadi salah satu alternatif kunci pencarian data.|
|AB-06|Pemesanan pembelian barang ke pemasok dipicu otomatis ketika stok fisik kurang dari batas minimum yang ditentukan.|





**6. Kebutuhan Informasi (KI)**



|***Kode***|***Kebutahan Informasi ( Laporan )***|***Sumber Data Terkait***|
|-|-|-|
|KI-01|Rekapitulasi omzet dan jumlah nota per hari maupun per bulan.|Penjualan, Detail Penjualan|
|KI-02|Laporan 5 barang terlaris berdasarkan kuantitas per bulan.|Barang, Detail penjualan|
|KI-03|Informasi daftar barang dengan stok di bawah batas minimum.|Barang|
|KI-04|Daftar 10 anggota dengan total nominal belanja terbesar per bulan.|Penjualan, Detail Penjualan, Anggota|







**7. Matriks CRUD**



Keterangan		:



* C (Create)		: Membuat atau menambahkan data.
* R (Read)		: Membaca atau melihat data.
* U (Update)		: Memperbarui data.
* D (Delete)		: Menghapus data.



|***Proses Bisnis***|***Anggota***|***Barang***|***Penjualan***|***Detail Penjualan***|***Pemasok***|***Pembelian***|
|-|-|-|-|-|-|-|
|PB-01 — Mendaftarkan Anggota Baru|C, R|-|-|-|-|-|
|PB-02 — Mencatat Transaksi Penjualan|R|R,U|C|C|-|-|
|PB-03 — Memesan Barang ke Pemasok|-|R|-|-|R|C|
|PB-04 — Menerima Barang dari Pemasok|-|U|-|-|R|U|
|PB-05 — Menyusun Laporan Bulanan|R|R|R|R|-|R|





**8. Kamus Data Awal**



|***Nama Elemen***|***Deskripsi***|***Contoh Nilai***|***Aturan/Batasan***|***Penanggung Jawab***|
|-|-|-|-|-|
|No Anggota|No Kartu Anggota|A-0457|Unik, format A- diikuti 4 digit|Ketua|
|Npm Anggota|Npm Mahasiswa|25430040|Unik, 10 digit|Ketua|
|No Hp Anggota|Nomer Kontak Telepon|081234567890|Data privasi khusus, akses terbatas|Ketua|
|No Nota|Nomer Nota Transaksi|PJ-2609-0142|Unik untuk setiap nota|Ketua|
|Harga Satuan|Harga Jual Saat Transaksi|4000|Bilangan minimal 0|Ketua|
|Stok Barang|Jumalah ketersedian Fisik|35|Bilangan bulat minimal 0|Petugas Gudang|





**9. Kebutuhan Non-Fungsional dan Pengelolaan Data**



* Volume Operasional	: Perkiraan volume transaksi mencapai sekitar 150 nota per hari. Data historis transaksi disimpan sekurang-kurangnya selama 5 tahun.
* Kebijakan Privasi	: Nomor HP anggota diklasifikasikan sebagai informasi pribadi yang dilindungi dan hanya memiliki hak akses terbatas, yakni hanya dapat diakses oleh Ketua Koperasi.

