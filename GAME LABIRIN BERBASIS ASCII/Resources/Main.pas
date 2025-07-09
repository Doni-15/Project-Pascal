program GameLabirin;
uses crt;

type 
    Info_Pemain = record
        Nama : string;
        NIM : integer;
        Avatar : char;
    end;

var
    pemain : Info_Pemain;
    NamaFileText : array[1..3] of string = ('level1.txt', 'level2.txt', 'level3.txt');
    Labirin: array[1..100, 1..300] of char;
    FileLevel: TextFile;
    baris, kolom, i, j, PosisiX, PosisiY, MenangX, MenangY, mundur, pilih: integer;
    pilihan : char;

//Prosedure membuat panjang baris dan kolom disesuaikan dengan isi file
procedure FileLabirin(NamaFileText : string; var baris, kolom : integer);
var
    FileLabirin : TextFile;
    s : string;
    KolomFile : integer;
begin
    Assign(FileLabirin, NamaFileText);
    Reset(FileLabirin);

    baris := 0;
    kolom := 0;

    while not EOF(FileLabirin) do
    begin
        readln(FileLabirin, s);
        Inc(baris);
        KolomFile := Length(s);

        if KolomFile > kolom then kolom := KolomFile;
    end;
    Close(FileLabirin);
end;

//prosedure membaca isi dari file txt yang telah dibuat
procedure MemuatFileLevel(Level: String);
var 
    s : string;
begin
    Assign(FileLevel, Level);
    Reset(FileLevel);

    for i := 1 to baris do
    begin
        readln(FileLevel, s);

        for j := 1 to kolom do
        begin
            if j <= Length(s) then
            begin
                Labirin[i, j] := s[j];
                
                if Labirin[i, j] = 'M' then
                begin
                    PosisiX := i;
                    PosisiY := j;
                    Labirin[i, j] := ' ';
                end;
                if Labirin[i, j] = 'B' then
                begin
                    MenangX := i;
                    MenangY := j;
                end;
            end
            else
                Labirin[i, j] := ' '; 
        end;
    end;

    Close(FileLevel);
end;

//prosedur menampilkan isi file txt ke terminal
procedure MenampilkanLabirin;
begin
    for i := 1 to baris do
    begin
        for j := 1 to kolom do
        begin
            if (i = PosisiX) and (j = PosisiY) then 
            begin
                gotoxy(j, i); write(pemain.Avatar);
            end
            else
            begin
                gotoxy(j, i); write(Labirin[i, j]);
            end; 
        end;
    end;
end;

// Fungsi untuk memvalidasi gerakan
function ValidasiGerakkan(dx, dy: integer): boolean;
begin
    ValidasiGerakkan := False;

    if (PosisiX + dx > 0) and (PosisiX + dx <= Baris) and (PosisiY + dy > 0) and (PosisiY + dy <= Kolom) and (Labirin[PosisiX + dx, PosisiY + dy] <> '#') then
    begin
        ValidasiGerakkan := True;
    end;
end;

//prosedur membuat gerakan pemain
procedure GerakkanPemain(tombol: char);
var
    dx, dy: integer;
begin
    dx := 0;
    dy := 0;

    case tombol of
        'w': dx := -1;
        's': dx := 1; 
        'a': dy := -1;
        'd': dy := 1; 
    end;

    if (ValidasiGerakkan(dx, dy)) then
    begin
        PosisiX := PosisiX + dx;
        PosisiY := PosisiY + dy;
    end;
end;

//membuat tampilan menang
procedure TampilanMenang;
begin
    clrscr;
	gotoxy(55, 11); writeln('============================================================================');
    gotoxy(55, 12); writeln('**********                  SELAMAT, ANDA MENANG!                 **********');
    gotoxy(55, 13); writeln('============================================================================');
    gotoxy(55, 14); writeln('#                                                                          #');
    gotoxy(55, 15); writeln('#                 Anda telah berhasil keluar dari labirin!                 #');
    gotoxy(55, 16); writeln('#          Teruskan petualangan Anda untuk tantangan selanjutnya!          #');
    gotoxy(55, 17); writeln('#                                                                          #');
    gotoxy(55, 18); writeln('#        Apakah anda ingin melanjut ke level selanjutnya ? [Y / N] :       #');
    gotoxy(55, 19); writeln('============================================================================');  

    gotoxy(124, 18); readln(pilihan);

    if (pilihan = 'y') or (pilihan = 'Y') then
        clrscr
    else
    begin
        clrscr;
        halt;
    end;
end;

//prosedur untuk level 1
procedure level1;
begin
    FileLabirin('level1.txt', baris, kolom);
    MemuatFileLevel('level1.txt');
    MenampilkanLabirin;

    repeat
        GerakkanPemain(ReadKey);
        MenampilkanLabirin;
    until (PosisiX = MenangX) and (PosisiY = MenangY);   

    TampilanMenang;
end;

//prosedur untuk level 
procedure level2;
begin
    FileLabirin('level2.txt', baris, kolom);
    MemuatFileLevel('level2.txt');
    MenampilkanLabirin;

    repeat
        GerakkanPemain(ReadKey);
        MenampilkanLabirin;
    until (PosisiX = MenangX) and (PosisiY = MenangY);

    TampilanMenang;
end;

//prosedur untuk level 
procedure level3;
begin
    FileLabirin('level3.txt', baris, kolom);
    MemuatFileLevel('level3.txt');
    MenampilkanLabirin;

    repeat
        GerakkanPemain(ReadKey);
        MenampilkanLabirin;
    until (PosisiX = MenangX) and (PosisiY = MenangY);

    TampilanMenang;
end;

// prosedure tampilan awal
procedure TampilanAwal;
begin
    gotoxy(55, 1); write('============================================================================');
    gotoxy(55, 2); write('************         SELAMAT DATANG DI GAME LABIRIN KAMI        ************');
    gotoxy(55, 3); write('============================================================================');

    gotoxy(55, 15); write('===========================================================================');
    gotoxy(55, 16); write('********************          ATURAN PERMAINAN         ********************');
    gotoxy(55, 17); write('===========================================================================');
    gotoxy(55, 18); write('1. Tekan w, s, a, dan d jika ingin bergerak                                ');
    gotoxy(55, 19); write('2. Tekan w untuk bergerak ke atas                                          ');
    gotoxy(55, 20); write('3. Tekan s untuk bergerak ke bawah                                         ');
    gotoxy(55, 21); write('4. Tekan a untuk bergerak ke kiri                                          ');
    gotoxy(55, 22); write('5. Tekan d untuk bergerak ke kanan                                         ');
    gotoxy(55, 23); write('6. Jangan menahan atau menekan tombol secara terus-menerus karena          ');
    gotoxy(55, 24); write('   tombol menyelesaikan instruksi satu-persatu                             ');
    gotoxy(55, 25); write('7. Perkecil tampilan vscode dengan mengklik (CTRL + -) agar labirin        ');
    gotoxy(55, 26); write('   dimuat dengan sempurna                                                  ');
    gotoxy(55, 27); write('8. Tekan (CTRL + SHIFT + E) untuk menutup Eksplorer agak memperbesar layar ');
    gotoxy(55, 28); write('===========================================================================');

    gotoxy(55, 10); write('              [ MULAI ]                       [ KELUAR ] ');
    gotoxy(55, 11); write('                 [1]                              [2]    ');

    with pemain do
    begin
        gotoxy(55, 5); write('Masukkan Nama Anda   : ');
        gotoxy(55, 6); write('Masukkan NIM Anda    : '); 
        gotoxy(55, 7); write('Pilih Avatar Anda    : '); 
        gotoxy(55, 8); write('Avatar [A / B / P] atau huruf lain yang bertipe data char atau satu karakter');

        gotoxy(78, 5); readln(Nama);
        gotoxy(78, 6); readln(NIM);
        gotoxy(78, 7); readln(Avatar);

        repeat
            gotoxy(78, 7); write('                                               ');
            gotoxy(78, 7); readln(Avatar);

            if Length(Avatar) <> 1 then
            begin
                gotoxy(55, 8); write('Avatar [A / B / P] atau huruf lain yang bertipe data char atau satu karakter');
            end;

        until (Length(Avatar) = 1);
    end;
    
    gotoxy(55, 13); write('PILIHAN ANDA : '); readln(pilih);
    
end;

begin
    clrscr;
    TampilanAwal;

    if pilih = 1 then
        clrscr
    else if pilih = 2 then
    begin
        clrscr;
        halt;     
    end;

    level1;
    level2;
    level3;
end.
