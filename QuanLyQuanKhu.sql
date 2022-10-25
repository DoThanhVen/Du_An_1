Create Database QuanLyQuanKhu
CREATE TABLE [Quân Trang] (
  [MaQuanTrang] nvarchar(50) not null,
  [MaChienSi] nvarchar(50) not null,
  [Ao] Int,
  [Giay] Int,
  [Quan] Int,
  [Khan] Int,
  [Tat] Int,
  [Dep] Int,
  [Chieu] Int,
  [Mu] Int,
  [BaloVaTui] Int,
  [MuGiaChien] Int,
  [MuKePi] Int,
  [GiayThatLung] Int,
  [ChanCaNhan] Int,
  [GoiNam] Int,
  [AoLot] Int,
  PRIMARY KEY ([MaQuanTrang])
);

CREATE TABLE [Quân Nhân] (
  [MaChienSi] nvarchar(50) not null,
  [TenChienSi] nvarchar not null,
  [QuanHam] nvarchar not null,
  [HinhAnh] nvarchar(50) not null,
  [GioiTinh] nvarchar not null,
  [NgaySinh] Date,
  [MaQuanTrang] nvarchar(50) not null,
  [NgayNhapNgu] Date,
  [NgayXuatNgu] Date,
  [MaTieuDoi] nvarchar(50) not null,
  PRIMARY KEY ([MaChienSi])
);

CREATE TABLE [Đại Đội] (
  [MaDaiDoi] nvarchar(50) not null,
  [TrungDoi] nvarchar(50) not null,
  [MaTieuDoan] nvarchar(50) not null,
  PRIMARY KEY ([MaDaiDoi])
);

CREATE TABLE [Trung Đội] (
  [MaTrungDoi] nvarchar(50) not null,
  [MaTieuDoi] nvarchar(50) not null,
  PRIMARY KEY ([MaTrungDoi]),
  CONSTRAINT [FK_Trung Đội.MaTrungDoi]
    FOREIGN KEY ([MaTrungDoi])
      REFERENCES [Đại Đội]([MaDaiDoi])
);

CREATE TABLE [Tiều Đội] (
  [MaTieuDoi] nvarchar(50) not null,
  [MaQuanNhan] nvarchar(50) not null,
  PRIMARY KEY ([MaTieuDoi]),
  CONSTRAINT [FK_Tiều Đội.MaTieuDoi]
    FOREIGN KEY ([MaTieuDoi])
      REFERENCES [Trung Đội]([MaTrungDoi])
);

CREATE TABLE [Quân Khu] (
  [MaQuanKhu] nvarchar(50) not null,
  [MaDaiDoi] nvarchar(50) not null,
  PRIMARY KEY ([MaQuanKhu])
);

CREATE TABLE [Sư Đoàn] (
  [MaSuDoan] nvarchar(50) not null,
  [MaQuanKhu] nvarchar(50) not null,
  PRIMARY KEY ([MaSuDoan])
);

CREATE TABLE [Trung Đoàn] (
  [MaTrungDoan] nvarchar(50) not null,
  [MaSuDoan] nvarchar(50) not null,
  PRIMARY KEY ([MaTrungDoan]),
  CONSTRAINT [FK_Trung Đoàn.MaTrungDoan]
    FOREIGN KEY ([MaTrungDoan])
      REFERENCES [Sư Đoàn]([MaSuDoan])
);

CREATE TABLE [Tiểu Đoàn] (
  [MaTieuDoan] nvarchar(50) not null,
  [MaTrungDoan] nvarchar(50) not null,
  PRIMARY KEY ([MaTieuDoan]),
  CONSTRAINT [FK_Tiểu Đoàn.MaTieuDoan]
    FOREIGN KEY ([MaTieuDoan])
      REFERENCES [Trung Đoàn]([MaTrungDoan])
);

