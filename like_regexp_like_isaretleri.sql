/*
LIKE veya ILIKE(küçük büyük harf duyarsız) için

wildcard (Joker : %) --> 0 veya daha fazla karakter gelebilir
'E%' ilk harfinden sonra 0 veya daha fazla karakter olabilir gibi
'%an%' başında ve sonunda 0 veya daha fazla karakter olabilir gibi

underscore (_): 1 tane karakteri temsil eder
'_ü%' ilk başta bir karakter olduğunu gösteriyor ü ise 2.karakter
'__v_' başta 2 karakter olduğunu 3. karakterin 'v' olduğunu 
ve 4. karakteri olduğunu gösteriyor


REGEXP_LIKE(~) için

[] : içerisindeki  harflerden en az birini temsil eder
'h[ai]t' ilk harfin 'h' olduğunu 2. harfin 'a veya i' olduğunu
3. harfin 't' olduğunu  gösteriyor

küçük büyük harf olmasın istersek * işaretide kullanırız
~* yazarak büyük küçük harf duyarsız hale getirebiliriz

[-]:iki harf arasındaki harflerden birini temsil eder
'h[a-z]t' ilk harf 'h' 2.harf 'a dan z ye kadar bir harf'
3. harf ise 't'

^:başlangıcı gösterir 
'^a' a ile başlayan demek

$:bitişi gösterir
'a$' a ile biten demek

(.*)-->0 veya daha fazla karakteri temsil eder
'^y.*f$' 'y' ile başlayan '0 veya birden fazla karakter olabilir'
ve 'f' ile biten

(.) -->sadece 1 karakteri temsil eder
'^y.*f$' 'y' ile başlayan '1 karakter olduğunu gösteriyor'
ve 'f' ile biten

NOT LIKE:verilen karakter desenine benzemeyenleri filtreler
!~     :verilen karakter desenine benzemeyenleri filtreler

NOT ILIKE 'h%' h ile başlamayan

!~* '^h'       h ile başlamayan



*/