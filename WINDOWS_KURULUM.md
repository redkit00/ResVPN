# RES VPN — WINDOWS'TAN IPA ÜRETME VE İPHONE'A KURMA

Bu paket özellikle Windows kullanımı için hazırlanmıştır.

## Sistem nasıl çalışıyor?

Windows'ta Xcode çalışmadığı için iOS uygulamasını yerel olarak derlemiyoruz.

Akış:

Windows
→ Kaynak kodu GitHub'a yükle
→ GitHub Actions içindeki macOS runner Xcode ile derler
→ `ResVPN-unsigned.ipa` oluşur
→ IPA Windows'a indirilir
→ AltStore Classic / AltServer ile ücretsiz Apple hesabınla imzalanır
→ iPhone'a kurulur

Bu nedenle Mac bilgisayar satın almak gerekmez.

---

## 1. GitHub hesabı

https://github.com adresinden ücretsiz hesap aç.

Yeni bir repository oluştur.

Önerilen ad:

`ResVPN`

Public repository seçersen GitHub'ın standart hosted runner'ları ücretsiz kullanılabilir.
Private repository'lerde ücretsiz dakika kotası uygulanabilir.

---

## 2. Bu paketi GitHub'a yükle

ZIP'i Windows'ta çıkart.

Repository sayfasında:

Add file
→ Upload files

Bu klasörde bulunan TÜM dosya ve klasörleri yükle.

Önemli:
`.github` klasörünün de yüklenmiş olması gerekir.

Commit changes de.

---

## 3. IPA'yı GitHub'da üret

Repository'de:

Actions
→ Build ResVPN IPA
→ Run workflow
→ Run workflow

Derleme tamamlandığında sayfanın altında:

Artifacts
→ ResVPN-IPA

dosyasını indir.

İnen dosya bir ZIP olacaktır.

ZIP'i açınca:

`ResVPN-unsigned.ipa`

bulunur.

Bu IPA henüz senin Apple hesabınla imzalı değildir. AltStore kurarken yeniden imzalayacaktır.

---

## 4. Windows'a AltStore Classic / AltServer kur

AltStore Classic'in Windows kurulumu için AltServer kullanılır.

AltStore'un resmi Windows rehberine göre:
- Windows 10 veya daha yenisi kullanılabilir.
- iPhone USB ile PC'ye bağlanabilir.
- AltServer Windows'ta çalışır.
- iOS 16+ için Developer Mode açılması gerekir.
- Ücretsiz Apple hesabıyla sideload edilen uygulamalar 7 gün geçerlidir.
- AltServer açıkken uygulamaları süre dolmadan refresh etmek mümkündür.

AltStore'un kendi rehberi güncel adımlar için kullanılmalıdır.

---

## 5. ResVPN IPA'yı yükle

AltStore iPhone'a kurulduktan sonra:

iPhone
→ AltStore
→ My Apps
→ `+`
→ `ResVPN-unsigned.ipa`

dosyasını seç.

AltStore IPA'yı senin ücretsiz Apple hesabınla yeniden imzalayıp yükler.

---

## 6. İlk açılış

iPhone'da gerekiyorsa:

Ayarlar
→ Gizlilik ve Güvenlik
→ Developer Mode

etkinleştir.

Ardından Res VPN'i aç.

---

## 7. VPN tarafı

Bu ücretsiz ResVPN sürümü doğrudan Apple Network Extension tüneli açmaz.

Uygulama:
- VPN profil adı
- Sunucu
- Remote Identifier
- Kullanıcı adı
- Şifre

bilgilerini alır ve bir IKEv2 `.mobileconfig` profili üretir.

Profili iPhone'a kurduktan sonra gerçek bağlantıyı iOS'un yerleşik VPN sistemi yapar.

VPN'in internete gerçekten bağlanabilmesi için ayrıca çalışan bir IKEv2 sunucumuz olması gerekir.

---

## 8. 7 gün dolunca

Uygulamayı silmek zorunda değilsin.

Windows'ta AltServer açık ve iPhone aynı ağdayken AltStore uygulamayı refresh etmeyi deneyebilir.

Olmazsa yeniden IPA'yı yükleyerek tekrar imzalarsın.

---

## ÖNEMLİ GÜVENLİK NOTU

`.mobileconfig` VPN profili oluşturulurken VPN kullanıcı parolası profilin içine yazılabilir.
Profil dosyasını üçüncü kişilerle paylaşma.

Apple ID parolanı proje dosyalarına, GitHub repository'sine veya kaynak koda yazma.
Apple hesabı yalnızca AltStore/AltServer'ın imzalama aşamasında kullanılmalıdır.
