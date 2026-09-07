# Res VPN — iOS ücretsiz kişisel sürüm

Bu proje, Apple'ın özel Network Extension entitlement'ına ihtiyaç duymadan,
iOS'un yerleşik IKEv2 VPN motoru için `.mobileconfig` profili üretir.

## Ne yapar?

- Sunucu adresi / alan adı girilir.
- Remote Identifier girilir.
- Kullanıcı adı ve şifre girilir.
- Uygulama bir IKEv2 `.mobileconfig` dosyası üretir.
- Profil iPhone'a kurulduktan sonra bağlantı iOS Ayarlar > VPN bölümünden açılır.
- Uygulama şifreyi UserDefaults'a kaydetmez.

## Neden doğrudan "Bağlan" düğmesi yok?

Gerçek bir iOS uygulamasının `NEVPNManager` veya Packet Tunnel Provider ile
VPN'i doğrudan yönetmesi Apple'ın Personal VPN / Network Extension entitlement'ını
gerektirir. Ücretsiz Personal Team ile hedefimiz, 0 TL maliyetle çalışan
yerleşik IKEv2 profil yolunu kullanmaktır.

## Xcode ile çalıştırma

1. Mac'te Xcode'u aç.
2. `ResVPN.xcodeproj` dosyasını aç.
3. ResVPN target > Signing & Capabilities bölümüne git.
4. Team olarak ücretsiz Apple hesabındaki `Personal Team` seç.
5. Bundle Identifier çakışırsa `com.resul.resvpn` değerini benzersiz bir isimle değiştir.
6. iPhone'u Mac'e bağla.
7. Gerekirse iPhone'da Developer Mode'u etkinleştir.
8. Xcode'da iPhone'u hedef seçip Run (`⌘R`) yap.

Ücretsiz Personal Team ile uygulamanın provisioning profili 7 günlüktür.
Süre bitince Xcode'dan tekrar Run ederek yeniden imzalanır/kurulur.

## Profil kurulumu

Uygulamadaki `VPN Profilini Oluştur` düğmesi `.mobileconfig` üretir ve paylaşım
ekranını açar. Profili iPhone'un kabul ettiği bir yöntemle açıp Ayarlar'daki
`Profil İndirildi` bölümünden kur.

Profilin içinde VPN kullanıcı parolası bulunabilir. Dosyayı kimseyle paylaşma.

## Sunucu gereksinimi

Bu uygulamanın gerçekten internete VPN ile çıkabilmesi için IKEv2 uyumlu bir
VPN sunucusu gerekir. Önerilen ücretsiz kişisel düzen:

- Evde açık Linux PC / mini PC, veya
- Sahip olduğun mevcut bir sunucu,
- strongSwan IKEv2,
- Geçerli sunucu sertifikası,
- UDP 500 ve UDP 4500 erişimi.

Sunucu yoksa arayüz ve profil üretimi çalışır, fakat VPN bağlantısı kurulamaz.

## Protokol

Profil EAP kullanıcı adı / parola ile IKEv2 için üretilir:

- `AuthenticationMethod = None`
- `ExtendedAuthEnabled = 1`
- `AuthName`
- `AuthPassword`
- `RemoteAddress`
- `RemoteIdentifier`

Sunucu tarafı buna uygun yapılandırılmalıdır.
