%Rastgele 3 tip(yıldız,daire,kare) noktalarının oluşturulması
%yıldız 2.bölgede
%kare 1.bölgede
%daire 3. bölgede=>yer almaktadır.

%Yıldız%
dia = 5*rand(10,2);
for l=[1:10]
    dia(l,1)=dia(l,1)*(-1);
end
for k=[1:10]
        plot(dia(k,1),dia(k,2),'*','MarkerSize',8,'MarkerEdgeColor','blue')
        hold on
end

%Kare%
squ = 5*rand(10,2);
for k=[1:10]
        plot(squ(k,1),squ(k,2),'s','MarkerSize',8,'MarkerEdgeColor','black','MarkerFaceColor','yellow')
        hold on
end

%Daire%
cir = 5*rand(10,2);
for l=[1:10]
    cir(l,1)=cir(l,1)*(-1);
    cir(l,2)=cir(l,2)*(-1);
end
for k=[1:10]
        plot(cir(k,1),cir(k,2),'o','MarkerSize',8,'MarkerEdgeColor','black','MarkerFaceColor','green')
        hold on
end

%X noktasının rastgele oluşturulması ve içi dolu yıldız ile grafikte
%gösterimi
x=-5+(5+5)*rand(1,2);
plot(x(1,1),x(1,2),'p','MarkerSize',8,'MarkerEdgeColor','black','MarkerFaceColor','black')


%Öklid hesaplamaları=>oklid dizisinde tutulacak
oklid=zeros(30,2);
for o=[1:10]
        oklid(o,1)=sqrt(((dia(o,1)-x(1,1))^2)+((dia(o,2)-x(1,2))^2));
        oklid(o,2)=1;
end
for o=[1:10]
        oklid(o+10,1)=sqrt(((cir(o,1)-x(1,1))^2)+((cir(o,2)-x(1,2))^2));
        oklid(o+10,2)=2;
end
for o=[1:10]
        oklid(o+20,1)=sqrt(((squ(o,1)-x(1,1))^2)+((squ(o,2)-x(1,2))^2));
        oklid(o+20,2)=3;
end
%Öklid küçükten büyüğe sıralanması
for i=[1:30]
    for j=[1:30-i]
        if(oklid(j,1)>oklid(j+1,1))
            temp1=oklid(j,1);
            oklid(j,1)=oklid(j+1,1);
            oklid(j+1,1)=temp1;
            
            temp2=oklid(j,2);
            oklid(j,2)=oklid(j+1,2);
            oklid(j+1,2)=temp2;
        end
    end
end
%Sıralanmış öklid listesi komut penceresine yazdırılıyor=>
oklid

%En yakın komşuyu bulmak için yakın 7 komşuya bakılacak.
yildiz=0;
kare=0;
daire=0;
for komsu=[1:7]
   if(oklid(komsu,2)==1)
       yildiz=yildiz+1;
   elseif(oklid(komsu,2)==2)
       daire=daire+1;
   elseif(oklid(komsu,2)==3)
       kare=kare+1;
   end
end

max=yildiz;
asil='Yildiz';
if(max<kare)
    max=kare;
    asil='Kare';
elseif(max<daire)
    max=daire;
    asil='Daire';
end
  
%En yakın komşunun adı asil değişkeninde
%Komut penceresine yazdırılıyor=>
asil
