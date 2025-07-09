program bangun;
uses crt;

label
    menu_utama, bangun_datar, bangun_ruang, ulang;

const
    pi = 3.14;
var
    panjang, lebar, tinggi, sisi1, sisi2, sisi3, pilihan,  datar, ruang : integer;
    keliling, luas, volume, luas_permukaan, sisi4 : real;
    pilih: char;

begin
    (* tampilan awal pada output  *)
    menu_utama:
    clrscr;
    gotoxy(30, 2); write('          PROGRAM BANGUN RUANG DAN BANGUN DATAR');
    gotoxy(30, 3); write('===========================================================');
    gotoxy(30, 5); write('Silakan Pilih Salah Satu Dari Pilihan Berikut : ');
    gotoxy(30, 6); write('[1] Bangun Datar '); 
    gotoxy(30, 7); write('[2] Bangun Ruang '); 
    gotoxy(30, 9); write('Masukkan pilihan anda : '); readln(pilihan);

    (* kondisi ketika menginput angka 1 *)
    if (pilihan = 1) then
    begin
        bangun_datar:
        clrscr;
        gotoxy(30, 2); write('                         BANGUN DATAR');
        gotoxy(30, 3); write('           Mencari Luas dan Keliling Bangun Datar');
        gotoxy(30, 4); write('===========================================================');
        gotoxy(30, 6); writeln('Silakan pilih salah satu dari pilihan berikut : ');
        gotoxy(30, 7); write('[1] Persegi'); 
        gotoxy(30, 8); write('[2] Persegi Panjang '); 
        gotoxy(30, 9); write('[3] Segitiga '); 
        gotoxy(30, 10); write('[4] Jajargenjang '); 
        gotoxy(30, 11); write('[5] Belah Ketupat '); 
        gotoxy(30, 12); write('[6] Trapesium '); 
        gotoxy(30, 13); write('[7] Layang-layang '); 
        gotoxy(30, 14); write('[8] Lingkaran '); 
        gotoxy(30, 16); write('Masukkan pilihan anda : '); readln(datar);   

        (* kondisi saat mengetik angka tertentu pada inputan *)
        case datar of
            (* kondisi ketika diketik angka 1 *)
            1: begin
                gotoxy(54, 16); write(' [1] Persegi');
                gotoxy(30, 18); write('Masukkan sisi persegi (cm) : '); readln(sisi1);
                luas := sisi1 * sisi1;
                keliling := 4 * sisi1;
                gotoxy(30, 20); write('Luas Persegi               : ', luas:0:0, ' cm^2');
                gotoxy(30, 21); write('Keliling Persegi           : ', keliling:0:0, ' cm');
            end;

            (* kondisi ketika diketik angka 2 *)
            2: begin
                gotoxy(54, 16); write(' [2] Persegi Panjang');
                gotoxy(30, 18); write('Masukkan Panjang Persegi Panjang (cm) : '); readln(panjang);
                gotoxy(30, 19); write('Masukkan Lebar Persegi Panjang   (cm) : '); readln(lebar);
                luas := panjang * lebar;
                keliling := 2 * (panjang + lebar);
                gotoxy(30, 21); writeln('Luas Persegi Panjang                : ', luas:0:0, ' cm^2');
                gotoxy(30, 22); writeln('Keliling Persegi Panjang            : ', keliling:0:0, ' cm');
            end;

            (* kondisi ketika diketik angka 3 *)
            3: begin
                gotoxy(54, 16); write(' [3] Segitiga');
                gotoxy(30, 18); write('Masukkan Sisi Pertama Segitiga (cm) : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Sisi Kedua Segitiga   (cm) : '); readln(sisi2);
                gotoxy(30, 20); write('Masukkan Sisi Ketiga Segitiga  (cm) : '); readln(sisi3);
                sisi4 := (sisi1 + sisi2 + sisi3) / 2;
                luas := sqrt(sisi4 * (sisi4 - sisi1) * (sisi4 - sisi2) * (sisi4 - sisi3));
                keliling := sisi1 + sisi2 + sisi3;
                gotoxy(30, 22); writeln('Luas Segitiga                     : ', luas:0:2, ' cm^2');
                gotoxy(30, 23); writeln('Keliling Segitiga                 : ', keliling:0:2, ' cm');
            end;

            (* kondisi ketika diketik angka 4 *)
            4: begin
                gotoxy(54, 16); write(' [4] Jajargenjang');
                gotoxy(30, 18); write('Masukkan Sisi Atas dan Bawah Jajargenjang   (cm) : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Sisi Kanan dan Kiri Jajargenjang   (cm) : '); readln(sisi2);
                gotoxy(30, 20); write('Masukkan Tinggi Jajargenjang                (cm) : '); readln(tinggi);
                luas := sisi1 * tinggi;
                keliling := 2 * (sisi1 + tinggi);
                gotoxy(30, 22); writeln('Luas Jajargenjang               : ', luas:0:0, ' cm^2');
                gotoxy(30, 23); writeln('Keliling Jajargenjang           : ', keliling:0:0, ' cm');
            end;

            (* kondisi ketika diketik angka 5 *)
            5: begin
                gotoxy(54, 16); write(' [5] Belah Ketupat');
                gotoxy(30, 18); write('Masukkan Sisi Belah Ketupat       (cm) : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Diagonal 1 Belah Ketupat (cm) : '); readln(panjang);
                gotoxy(30, 20); write('Masukkan Diagonal 2 Belah Ketupat (cm) : '); readln(lebar);
                luas := (panjang * lebar) / 2;
                keliling := sisi1 * 4;
                gotoxy(30, 22); writeln('Luas Belah Ketupat               : ', luas:0:2, ' cm^2');
                gotoxy(30, 23); writeln('Keliling Belah Ketupat           : ', keliling:0:2, ' cm');
            end;

            (* kondisi ketika diketik angka 6 *)
            6: begin
                gotoxy(54, 16); write(' [6] Trapesium');
                gotoxy(30, 18); write('Masukkan Sisi Sejajar Atas Trapesium  (cm) : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Sisi Sejajar Bawah Trapesium (cm) : '); readln(sisi2);
                gotoxy(30, 20); write('Masukkan Sisi Miring Kanan Trapesium  (cm) : '); readln(sisi3);
                gotoxy(30, 21); write('Masukkan Sisi Miring Kiri Trapesium   (cm) : '); readln(sisi4);
                gotoxy(30, 22); write('Masukkan Tinggi Trapesium             (cm) : '); readln(tinggi);
                luas := ((sisi1 + sisi2) * tinggi);
                keliling := sisi1 + sisi2 + sisi3 + sisi4;                          
                gotoxy(30, 24); writeln('Luas Trapesium               : ', luas:0:2, ' cm^2');
                gotoxy(30, 25); writeln('Keliling Trapesium           : ', keliling:0:2, ' cm');
            end;

            (* kondisi ketika diketik angka 7 *)
            7: begin
                gotoxy(54, 16); write(' [7] Layang-layang');
                gotoxy(30, 18); write('Masukkan Sisi Atas Layang-layang  (cm) : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Sisi Bawah Layang-layang (cm) : '); readln(sisi2);
                gotoxy(30, 20); write('Masukkan Diagonal 1 Layang-layang (cm) :'); readln(sisi3);
                gotoxy(30, 21); write('Masukkan Diagonal 2 Layang-layang (cm) :'); readln(sisi4);
                luas := (sisi3 * sisi4) / 2;
                keliling := (2 * sisi1) + (2 * sisi2);                         
                gotoxy(30, 23); writeln('Luas Layang-layang               : ', luas:0:2, ' cm^2');
                gotoxy(30, 24); writeln('Keliling Layang-layang           : ', keliling:0:2, ' cm');
            end;

            (* kondisi ketika diketik angka 8 *)
            8: begin
                gotoxy(54, 16); write(' [8] Lingkaran');
                gotoxy(30, 18); write('Masukkan Jari-Jari Lingkaran (cm) : '); readln(panjang);
                luas := pi * sqr(panjang);
                keliling := 2 * pi * panjang;
                gotoxy(30, 20); writeln('Luas Lingkaran                  : ', luas:0:2, ' cm^2');
                gotoxy(30, 21); writeln('Keliling Lingkaran              : ', keliling:0:2, ' cm');
            end;

            (* kondisi ketika diketik angka dari angka 8 *)            
            else
                begin
                    gotoxy(30, 17); write('Pilihan tidak ada. Silahkan masukkan angka yang tepat '); readln;
                    goto bangun_datar;
                end;
        end;
    end

    (* kondisi ketika menginput angka 2 *)
    else if (pilihan = 2) then
    begin
        bangun_ruang:
        clrscr;
        gotoxy(30, 2); write('                         BANGUN RUANG');
        gotoxy(30, 3); write('      Mencari Volume dan Luas Permukaan Bangun Ruang');
        gotoxy(30, 4); write('===========================================================');
        gotoxy(30, 6); writeln('Silakan pilih salah satu dari pilihan berikut : ');
        gotoxy(30, 7); write('[1] Kubus'); 
        gotoxy(30, 8); write('[2] Balok '); 
        gotoxy(30, 9); write('[3] Prisma Segitiga '); 
        gotoxy(30, 10); write('[4] Prisma Segiempat '); 
        gotoxy(30, 11); write('[5] Limas Segiempat '); 
        gotoxy(30, 12); write('[6] Kerucut '); 
        gotoxy(30, 13); write('[7] Tabung'); 
        gotoxy(30, 14); write('[8] Bola '); 
        gotoxy(30, 16); write('Masukkan pilihan anda : '); readln(ruang);

        case ruang of
            (* kondisi ketika diketik angka 1 *)
            1: begin
                gotoxy(54, 16); write(' [1] Kubus');
                gotoxy(30, 18); write('Masukkan Sisi Kubus (cm) : '); readln(sisi1);
                volume := sisi1 * sisi1 * sisi1;
                luas_permukaan := 6 * sisi1 * sisi1;
                gotoxy(30, 20); write('Volume Kubus               : ', volume:0:0, ' cm^3');
                gotoxy(30, 21); write('Luas Permukaan Kubus           : ', luas_permukaan:0:0, ' cm^2');
            end;

            (* kondisi ketika diketik angka 2 *)
            2: begin
                gotoxy(54, 16); write(' [2] Balok');
                gotoxy(30, 18); write('Masukkan Panjang Balok (cm) : '); readln(panjang);
                gotoxy(30, 19); write('Masukkan Lebar Balok   (cm) : '); readln(lebar);
                gotoxy(30, 20); write('Masukkan Tinggi Balok  (cm) : '); readln(tinggi);
                volume := panjang * lebar * tinggi;
                luas_permukaan := 2 * ((panjang * lebar) + (panjang * tinggi) + (lebar * tinggi));
                gotoxy(30, 22); write('Volume Balok               : ', volume:0:0, ' cm^3');
                gotoxy(30, 23); write('Luas Permukaan Balok           : ', luas_permukaan:0:0, ' cm^2');
            end;

            (* kondisi ketika diketik angka 3*)
            3: begin
                gotoxy(54, 16); write(' [3] Prisma Segitiga');
                gotoxy(30, 18); write('Masukkan Alas Segitiga (cm)    : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Tinggi Segitiga (cm)  : '); readln(tinggi);
                gotoxy(30, 20); write('Masukkan Tinggi Prisma (cm)    : '); readln(sisi3);
                luas := 0.5 * sisi1 * tinggi;
                volume := luas * sisi3;
                luas_permukaan := (2 * luas) + (3 * sisi1 * sisi3);
                gotoxy(30, 22); writeln('Volume Prisma Segitiga           : ', volume:0:2, ' cm^3');
                gotoxy(30, 23); writeln('Luas Permukaan Prisma Segitiga   : ', luas_permukaan:0:2, ' cm^2');
            end;

            (* kondisi ketika diketik angka 4 *)
            4: begin
                gotoxy(54, 16); write(' [4] Prisma Segiempat');
                gotoxy(30, 18); write('Masukkan Panjang Alas (cm)   : '); readln(panjang);
                gotoxy(30, 19); write('Masukkan Lebar Alas (cm)     : '); readln(lebar);
                gotoxy(30, 20); write('Masukkan Tinggi Prisma (cm)  : '); readln(tinggi);

                luas := panjang * lebar;
                volume := luas * tinggi;
                luas_permukaan := (2 * luas) + (4 * tinggi * panjang); 
                gotoxy(30, 22); writeln('Volume Prisma Segiempat         : ', volume:0:2, ' cm^3');
                gotoxy(30, 23); writeln('Luas Permukaan Prisma Segiempat : ', luas_permukaan:0:2, ' cm^2');
            end;

            (* kondisi ketika diketik angka 5 *)
            5: begin
                gotoxy(54, 16); write(' [5] Limas Segiempat');
                gotoxy(30, 18); write('Masukkan Panjang Sisi Alas (cm)  : '); readln(sisi1);
                gotoxy(30, 19); write('Masukkan Tinggi Limas (cm)       : '); readln(tinggi);

                volume := (1 / 3) * (sisi1 * sisi1) * tinggi;
                luas_permukaan := (sisi1 * sisi1) + (4 * (0.5 * sisi1 * sqrt((sisi1/2)*(sisi1/2) + tinggi*tinggi)));
                gotoxy(30, 21); writeln('Volume Limas Segiempat           : ', volume:0:2, ' cm^3');
                gotoxy(30, 22); writeln('Luas Permukaan Limas Segiempat   : ', luas_permukaan:0:2, ' cm^2');
            end;

            (* kondisi ketika diketik angka 6 *)
            6: begin
                gotoxy(54, 16); write(' [6] Kerucut');
                gotoxy(30, 18); write('Masukkan Jari-jari Alas Kerucut (cm) : '); readln(panjang);
                gotoxy(30, 19); write('Masukkan Tinggi Kerucut (cm)         : '); readln(tinggi);

                volume := (1 / 3) * pi * panjang * panjang * tinggi;
                luas_permukaan := pi * panjang * (panjang + sqrt((panjang * panjang) + (tinggi * tinggi)));
                gotoxy(30, 21); writeln('Volume Kerucut               : ', volume:0:2, ' cm^3');
                gotoxy(30, 22); writeln('Luas Permukaan Kerucut        : ', luas_permukaan:0:2, ' cm^2');
            end;

            (* kondisi ketika diketik angka 7 *)
            7: begin
                gotoxy(54, 16); write(' [7] Tabung');
                gotoxy(30, 18); write('Masukkan Jari-jari Alas Tabung (cm) : '); readln(panjang);
                gotoxy(30, 19); write('Masukkan Tinggi Tabung (cm)         : '); readln(tinggi);

                volume := pi * panjang * panjang * tinggi;
                luas_permukaan := (2 * pi * panjang * (panjang + tinggi));
                gotoxy(30, 21); writeln('Volume Tabung               : ', volume:0:2, ' cm^3');
                gotoxy(30, 22); writeln('Luas Permukaan Tabung        : ', luas_permukaan:0:2, ' cm^2');
            end;

            (* kondisi ketika diketik angka 8 *)
            8: begin
                gotoxy(54, 16); write(' [8] Bola');
                gotoxy(30, 18); write('Masukkan Jari-jari Bola (cm) : '); readln(panjang);

                volume := (4 / 3) * pi * panjang * panjang * panjang;
                luas_permukaan := 4 * pi * panjang * panjang;
                gotoxy(30, 20); writeln('Volume Bola               : ', volume:0:2, ' cm^3');
                gotoxy(30, 21); writeln('Luas Permukaan Bola        : ', luas_permukaan:0:2, ' cm^2');
            end;

            (* kondisi ketika diketik angka lebih besar dari angka 8 *)            
            else
                begin
                    gotoxy(30, 17); write('Pilihan tidak ada. Silahkan masukkan angka yang tepat '); readln;
                    goto bangun_ruang;
                end;
        end;
    end

    (* kondisi ketika diketik angka lebih besar dari 2 *)
    else
    begin
        gotoxy(30, 11); writeln('Tidak ada pilihan. Silahkan masukkan angka yang tersedia');
        gotoxy(30, 12); write('Tekan enter untuk mengulang. '); readln;
        goto menu_utama;
    end;


    ulang:
    writeln; readln; clrscr;
    gotoxy(30, 1); write('Apakah ingin menggunakan kembali ? [Y/N] : '); readln(pilih);
    case pilih of
        'Y', 'y' : goto menu_utama;
        'N', 'n' : begin
            gotoxy(30, 2); write('Terimakasih telah menggunakan program ini.'); 
            gotoxy(30, 3); write('Sampai jumpa kembali.'); readln; clrscr;
        end;
        else
            begin    
                gotoxy(30, 2); write('Pilihan Tidak Tersedia.');
                goto ulang; (* pergi ke program ulang *)
            end;
    end;
end.