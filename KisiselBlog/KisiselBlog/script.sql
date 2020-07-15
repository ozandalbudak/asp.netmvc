
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Blog](
	[B_id] [int] IDENTITY(1,1) NOT NULL,
	[B_Baslik] [nvarchar](max) NULL,
	[B_Icerik] [nvarchar](max) NULL,
	[B_Resim] [nvarchar](max) NULL,
	[B_Tarih] [nvarchar](max) NULL,
	[B_Yer] [nvarchar](max) NULL,
	[B_Link] [nvarchar](max) NULL,
	[B_Etiket] [nvarchar](max) NULL,
	[K_id] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[B_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kategoriler](
	[K_id] [int] IDENTITY(1,1) NOT NULL,
	[K_KategoriAdi] [nvarchar](max) NULL,
	[K_Sira] [int] NULL,
	[K_Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[K_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO





SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Menu](
	[M_id] [int] IDENTITY(1,1) NOT NULL,
	[Menu] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[Sira] [int] NULL,
	[icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[M_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SiteAyar](
	[A_id] [int] IDENTITY(1,1) NOT NULL,
	[A_Description] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NULL,
	[GoogleKod] [nvarchar](max) NULL,
	[Arkaplan] [nvarchar](max) NULL,
 CONSTRAINT [PK_SiteAyar] PRIMARY KEY CLUSTERED 
(
	[A_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO






SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Yonetici](
	[K_id] [int] IDENTITY(1,1) NOT NULL,
	[Resim] [nvarchar](max) NULL,
	[AdSoyad] [nvarchar](max) NULL,
	[Unvan] [nvarchar](max) NULL,
	[Gecmis] [nvarchar](max) NULL,
	[Dtarih] [nvarchar](max) NULL,
	[Eposta] [nvarchar](max) NULL,
	[Telefon] [nvarchar](max) NULL,
	[Memleket] [nvarchar](max) NULL,
	[Sehir] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Web] [nvarchar](max) NULL,
	[Kadi] [nvarchar](max) NULL,
	[Sifre] [nvarchar](max) NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[K_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Yorum](
	[Y_id] [int] IDENTITY(1,1) NOT NULL,
	[B_id] [int] NULL,
	[AdSoyad] [nvarchar](max) NULL,
	[Yorum] [nvarchar](max) NULL,
	[Eposta] [nvarchar](max) NULL,
	[Tarih] [nvarchar](max) NULL,
	[Onay] [bit] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[Y_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO








SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Blog] 
@B_id int = null, 
@B_Baslik nvarchar(max) = null, 
@B_Icerik nvarchar(max) = null, 
@B_Resim nvarchar(max) = null, 
@B_Tarih nvarchar(max) = null, 
@B_Yer nvarchar(max) = null, 
@B_Link nvarchar(max) = null, 
@B_Etiket nvarchar(max) = null, 
@K_id int = null, 
@Islem nvarchar(max) = null 
AS 
BEGIN 	SET NOCOUNT ON; 

if(@Islem = 'SonBlog') 
begin select top(5)*, (select count(*) from Yorum  where B_id = Blog.B_id and Onay = 'True') as yor from Blog  order by B_id desc 
end 

if(@Islem = 'BlogYazilar') 
begin select *, (select count(*) from Yorum  where B_id = Blog.B_id and Onay = 'True') as yor from Blog where B_Yer = 'Blog'  order by B_id desc 
end 

if(@Islem = 'BlogIcerik') 
begin
 select *, (select count(*) from Yorum  where B_id = Blog.B_id and Onay = 'True') as yor from Blog where B_id = @B_id and B_Link = @B_Link 
end 


if(@Islem = 'BlogYazilarKategori') 
begin
 select *, (select count(*) from Yorum  where B_id = Blog.B_id and Onay = 'True') as yor from Blog
 inner join Kategoriler as K on K.K_id = Blog.K_id
  where B_Yer = 'Blog' and K.K_id = @K_id  order by B_id desc 
end

if(@Islem = 'BlogIcerik') 
begin
select *, (select count(*) from Yorum  where B_id = Blog.B_id and Onay = 'True') as yor from Blog where B_id = @B_id and B_Link = @B_Link
end 

if(@Islem = 'Calismalar') 
begin 
select * from Blog where B_Yer = 'Calismalar'  order by B_id desc 
end 

if(@Islem = 'Y_BlogEkle') 
begin 
insert into Blog (B_Baslik, B_Icerik, B_Resim, B_Tarih, B_Yer, B_Link, B_Etiket, K_id) values (@B_Baslik, @B_Icerik, @B_Resim, @B_Tarih, @B_Yer, @B_Link, @B_Etiket, @K_id) 
end 

if(@Islem = 'Y_BlogSil') 
begin 
delete Blog where B_id = @B_id 
end 

if(@Islem = 'Y_BlogDuzenleGetir') 
begin 
select * from Blog where B_id = @B_id 
end 

if(@Islem = 'Y_BlogGetir') 
begin 
select * from Blog order by B_id desc 
end 

if(@Islem = 'Y_BlogGuncelle') 
begin 
update Blog set B_Baslik = @B_Baslik, B_Icerik = @B_Icerik, B_Resim = @B_Resim, B_Tarih = @B_Tarih, B_Yer = @B_Yer, B_Link = @B_Link, B_Etiket = @B_Etiket, K_id = @K_id where B_id = @B_id 
end 

if(@Islem = 'BlogSonraki')
begin
select * from Blog where B_id = @B_id 
end



if(@Islem = 'Y_BlogSayisi')
begin
select count(*) as Sayi from Blog where B_Yer = 'Blog'
end

if(@Islem = 'Y_CalismaSayisi')
begin
select count(*) as Cal from Blog where B_Yer = 'Calismalar'
end


if(@Islem = 'Y_SayfaSayisi')
begin
select count(*) as Say from Blog where B_Yer = 'Sayfa'
end



END 
GO















SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Kategoriler]
@K_id int = null,
@K_KategoriAdi nvarchar(max) = null,
@K_Sira int = null,
@K_Link nvarchar(max) = null,
@Islem nvarchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	if(@Islem = 'KategorilerGetir')
	begin
	select * from Kategoriler order by K_Sira
	end


	if(@Islem = 'Y_KategorilerGetir')
	begin
	select * from Kategoriler order by K_id desc
	end

	if(@Islem = 'Y_KategorilerDuzenleGetir')
	begin
	select * from Kategoriler where K_id = @K_id
	end



	if(@Islem = 'Y_KategorilerKaydet')
	begin
	insert into Kategoriler (K_KategoriAdi, K_Link, K_Sira) values (@K_KategoriAdi, @K_Link, @K_Sira)
	end


	if(@Islem = 'Y_KategoriDuzenle')
	begin
	update Kategoriler set K_KategoriAdi = @K_KategoriAdi, K_Link = @K_Link, K_Sira = @K_Sira where K_id = @K_id
	end


	if(@Islem = 'Y_KategoriSil')
	begin
	delete from Kategoriler where K_id = @K_id
	end


END

GO












SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Menu] 
@M_id int = null, 
@Menu nvarchar(max) = null, 
@Link nvarchar(max) = null, 
@Sira nvarchar(max) = null, 
@icon nvarchar(max) = null, 
@Islem nvarchar(max) = null 
AS 

BEGIN SET NOCOUNT ON; 

if(@Islem = 'MenuGetir') 
begin 
select * from Menu order by Sira 
end 

if(@Islem = 'Y_Menuler') 
begin select * from Menu order by M_id 
end 


if(@Islem = 'Y_MenuSil') 
begin 
delete Menu where M_id = @M_id 
end 

if(@Islem = 'Y_MenuDuzenle') 
begin 
select * from Menu where M_id = @M_id 
end 


if(@Islem = 'Y_MenuKaydet') 
begin 
insert into Menu (Menu, Link, Sira, icon) values (@Menu, @Link, @Sira, @icon) 
end 


if(@Islem = 'Y_MenuGuncelle') 
begin 
update Menu set Menu=@Menu, Link = @Link, Sira = @Sira, icon=@icon where M_id = @M_id 
end 

END 
GO










SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SiteAyar]
@A_id int = null,
@A_Description nvarchar(max) = null,
@Keywords nvarchar(max) = null,
@GoogleKod nvarchar(max) = null,
@Arkaplan nvarchar(max) = null,
@Islem nvarchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 if(@Islem = 'Y_SiteAyarYukle')
	   begin
	    select * from SiteAyar
		 end


  if(@Islem = 'Y_SiteAyarKaydet') 
  begin
   insert into SiteAyar (A_Description, Keywords, GoogleKod, Arkaplan) values (@A_Description, @Keywords, @GoogleKod, @Arkaplan)
    end 
		   
		   
if(@Islem = 'Y_SiteAyarGuncelle')
begin
 update SiteAyar set A_Description = @A_Description, Keywords = @Keywords, GoogleKod = @GoogleKod, Arkaplan = @Arkaplan where A_id = @A_id
  end 
END

GO









SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Yonetici] 
@K_id int = null, 
@Resim nvarchar(max) = null, 
@AdSoyad nvarchar(max) = null, 
@Unvan nvarchar(max) = null, 
@Gecmis nvarchar(max) = null, 
@Dtarih nvarchar(max) = null, 
@Eposta nvarchar(max) = null, 
@Telefon nvarchar(max) = null, 
@Memleket nvarchar(max) = null, 
@Sehir nvarchar(max) = null, 
@Facebook nvarchar(max) = null, 
@Twitter nvarchar(max) = null, 
@Web nvarchar(max) = null,  
@Kadi nvarchar(max) = null, 
@Sifre nvarchar(max) = null, 
@Islem nvarchar(max) = null 
AS 
BEGIN SET NOCOUNT ON; 

	if(@Islem = 'Y_SiteYukle') 
	begin 
		select * from Yonetici 
	end 

	if(@Islem = 'Y_SiteKaydet') 
	begin 
		insert into Yonetici (Resim, AdSoyad, Unvan, Gecmis, Dtarih, Eposta, Telefon, Memleket, Sehir, Facebook, Twitter, Web, Kadi, Sifre) values (@Resim, @AdSoyad, @Unvan, @Gecmis, @Dtarih, @Eposta, @Telefon, @Memleket, @Sehir, @Facebook, @Twitter, @Web, @Kadi, @Sifre)
	 end 
 
	 if(@Islem = 'Y_SiteGuncelle') 
	 begin 
		 update Yonetici set Resim =@Resim, AdSoyad =@AdSoyad, Unvan = @Unvan, Gecmis = @Gecmis, Dtarih =@Dtarih, Eposta =@Eposta, Telefon =@Telefon, Memleket =@Memleket, Sehir =@Sehir, Facebook =@Facebook, Twitter =@Twitter, Web =@Web, Kadi = @Kadi, Sifre = @Sifre 
	 end 
 
	 if(@Islem = 'Y_SiteSifre') 
	 begin 
		insert into Yonetici (Kadi, Sifre) values(@Kadi, @Sifre)  
	end

 END 
GO









SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Yorum] 
@Y_id int = null, 
@B_id int = null,
 @AdSoyad nvarchar(max) = null, 
 @Yorum nvarchar(max) = null, 
 @Eposta nvarchar(max) = null, 
 @Tarih nvarchar(max) = null, 
 @Onay bit = null, 
 @Islem nvarchar(max) = null 
 AS 
 
 BEGIN SET NOCOUNT ON; 
 
 if(@Islem = 'Y_Yorumlar') 
 begin 
 select * from Yorum where Onay = 'False' 
 end 
 
 
 if(@Islem = 'Y_YorumSil') 
 begin
 delete Yorum where Y_id = @Y_id 
 end 
 
 
 if(@Islem = 'Y_YorumOnayla') 
 begin 
 update Yorum set Onay = 'True' where Y_id = @Y_id 
 end 
 
 
 if(@Islem = 'YorumYaz') 
 begin 
 insert into Yorum (B_id, AdSoyad, Yorum, Eposta, Tarih, Onay) values (@B_id, @AdSoyad, @Yorum, @Eposta, @Tarih, @Onay) 
 end 
 
 
 if(@Islem = 'YorumlarGetir') 
 begin 
 select * from Yorum where B_id = @B_id and Onay = 'True' 
 end 
 
 if(@Islem = 'Y_YorumlarTum')
 begin 
 select * from Yorum where Onay = 'True' 
 end 
 
 END 
GO

















  insert into Menu (Menu, Link, Sira, icon) values ('Ana Sayfa', '/Default.aspx', 1, '86149anasayfa.png') 
  insert into Menu (Menu, Link, Sira, icon) values ('Hakkımda', '/Hakkinda.aspx', 2, '80365hakkimda.png')
  insert into Menu (Menu, Link, Sira, icon) values ('Blog', '/Blog.aspx', 3, '64737blog.png') 
  insert into Menu (Menu, Link, Sira, icon) values ('Çalışmalarım', '/Calismalarim.aspx', 4, '83712calismalarim.png') 
  insert into Menu (Menu, Link, Sira, icon) values ('İletişim', '/Iletisim.aspx', 5, '23363iletisim.png') 