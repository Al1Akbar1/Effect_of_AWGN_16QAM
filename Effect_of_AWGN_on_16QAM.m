clear;close;clc;
%% Part 1
StreamLength=4000;
A=randi(2,1,StreamLength)-1;

GraySymbols=strings(1,1000);
for i=1:1000
    GraySymbols(i)=strcat(num2str(A((i-1)*4+1)),num2str(A((i-1)*4+2)),num2str(A((i-1)*4+3)),num2str(A((i-1)*4+4)));
end
   
a=zeros(1,1000);
b=zeros(1,1000);
for i=1:1000
    switch GraySymbols(i)
        case '0000'
            a(i)=-3;
            b(i)=3;
        case '0001'
            a(i)=-3;
            b(i)=1;
        case '0100'
            a(i)=-1;
            b(i)=3;
        case '0101'
            a(i)=-1;
            b(i)=1;
        case '1100'
            a(i)=1;
            b(i)=3;
        case '1000'
            a(i)=3;
            b(i)=3;
        case '1101'
            a(i)=1;
            b(i)=1;
        case '1001'
            a(i)=3;
            b(i)=1;
        case '0011'
            a(i)=-3;
            b(i)=-1;
        case '0111'
            a(i)=-1;
            b(i)=-1;
        case '0010'
            a(i)=-3;
            b(i)=-3;
        case '0110'
            a(i)=-1;
            b(i)=-3;
        case '1111'
            a(i)=1;
            b(i)=-1;
        case '1011'
            a(i)=3;
            b(i)=-1;
        case '1110'
            a(i)=1;
            b(i)=-3;
        case '1010'
            a(i)=3;
            b(i)=-3;
        otherwise
            a(i)=0;
            b(i)=0;
            
    end
 
end
figure(1);
scatter(a,b)

S=0;
for i=1:1000
    S=S+a(i)^2+b(i)^2;
end
S=S/1000;



N20 =(1/sqrt(2)* randn(1000,1)+1i*1/sqrt(2)* randn(1000,1))/(sqrt(100));
N15 =(1/sqrt(2)* randn(1000,1)+1i*1/sqrt(2)* randn(1000,1))/(sqrt(31.62));
N10 =(1/sqrt(2)* randn(1000,1)+1i*1/sqrt(2)* randn(1000,1))/sqrt(10);
N05 =(1/sqrt(2)* randn(1000,1)+1i*1/sqrt(2)* randn(1000,1))/sqrt(3.162);
N00 =(1/sqrt(2)* randn(1000,1)+1i*1/sqrt(2)* randn(1000,1))/sqrt(1);

figure(2);

a1=a+real(N00)';
b1=b+imag(N00)';
scatter(a1,b1);
hold on
scatter(a,b,'color','red',"LineWidth",3)
figure(3)
a2=a+real(N05)';
b2=b+imag(N05)';

scatter(a2,b2)
hold on
scatter(a,b,'color','red',"LineWidth",3)

figure(4)
a3=a+real(N10)';
b3=b+imag(N10)';
scatter(a3,b3)
hold on
scatter(a,b,'color','red',"LineWidth",3)
figure(5)
a4=a+real(N15)';
b4=b+imag(N15)';
scatter(a4,b4)
hold on
scatter(a,b,'color','red',"LineWidth",3)
figure(6)
a5=a+real(N20)';
b5=b+imag(N20)';
scatter(a5,b5)
hold on
scatter(a,b,'color','red',"LineWidth",3)
% close all;
%% Part 2
g=1.2*exp(1i*10*pi/180);

figure(7)
scatter(a,b,"LineWidth",3)

hold on
c=(a+1i*b)*g;
scatter(real(c),imag(c),'color','red',"LineWidth",3)
% close all;
%% Part 3
figure(8)
t=(1:1:30)/30;
I=sqrt(2)*cos(2*pi*t)/sqrt(30);
p1=plot(I,'LineWidth',3);
m1="I";
Q=sqrt(2)*sin(2*pi*t)/sqrt(30);
hold on
p2=plot(Q,'Color','red','LineWidth',3);
m2="Q";
legend([p1 p2], [m1 m2]);
IntRand=randi([0 15],1,10000);
a=zeros(1,10000);
b=zeros(1,10000);
for i=1:10000
    switch IntRand(i)
        case 0
            a(i)=-3;
            b(i)=3;
        case 1
            a(i)=-3;
            b(i)=1;
        case 2
            a(i)=-1;
            b(i)=3;
        case 3
            a(i)=-1;
            b(i)=1;
        case 4
            a(i)=1;
            b(i)=3;
        case 5
            a(i)=3;
            b(i)=3;
        case 6
            a(i)=1;
            b(i)=1;
        case 7
            a(i)=3;
            b(i)=1;
        case 8
            a(i)=-3;
            b(i)=-1;
        case 9
            a(i)=-1;
            b(i)=-1;
        case 10
            a(i)=-3;
            b(i)=-3;
        case 11
            a(i)=-1;
            b(i)=-3;
        case 12
            a(i)=1;
            b(i)=-1;
        case 13
            a(i)=3;
            b(i)=-1;
        case 14
            a(i)=1;
            b(i)=-3;
        case 15
            a(i)=3;
            b(i)=-3;
        otherwise
            a(i)=0;
            b(i)=0;
            
    end
 
end
% time domain signal generate:
gensig=zeros(1,30000);
for i=1:10000
    gen=a(i)*I+b(i)*Q;
    gensig((1+30*(i-1):(30*i)))=gen;
end
figure(9)
plot(gensig)

% Impulse Response 1
h1=[1 -0.3 0 0.1 0 0 0 0 0 0 0 0 0 0 0];
figure(10)

plot(Q,'Color','red','LineWidth',2);
title("h1 and Q")
hold on
bar(h1,'FaceColor','blue');

% Convolve signal and Impulse Respons
convSig=conv(gensig,h1);


In=zeros(1,10000);
Qn=zeros(1,10000);
for i=1:10000
    In(i)=sum(convSig(1+30*(i-1):(30*i)).*I);
    Qn(i)=sum(convSig(1+30*(i-1):(30*i)).*Q);
end
figure(11)
scatter(a,b,'LineWidth',2)
hold on
scatter(In,Qn,'filled','color','red','LineWidth',1);

% Impulse Response 2
h2=[1 0 0.4 -0.2 0 0 0.1 0 0 0 0 0 0 0 0];
figure(12)
plot(Q,'Color','red','LineWidth',2);
title("h2 and Q")
hold on
bar(h2,'FaceColor','blue');

% Convolve signal and Impulse Respons
convSig=conv(gensig,h2);


In=zeros(1,10000);
Qn=zeros(1,10000);
for i=1:10000
    In(i)=sum(convSig(1+30*(i-1):(30*i)).*I);
    Qn(i)=sum(convSig(1+30*(i-1):(30*i)).*Q);
end
figure(13)
scatter(a,b,'LineWidth',2)
hold on
scatter(In,Qn,'filled','color','red','LineWidth',1);

% Impulse Response 3
h3=[1 0 0 0.3 0 -0.3 0 0 0.2 0.1 0 0 0 0 0];
figure(14)
plot(Q,'Color','red','LineWidth',2);
title("h3 and Q")
hold on
bar(h3,'FaceColor','blue');

% Convolve signal and Impulse Respons
convSig=conv(gensig,h3);


In=zeros(1,10000);
Qn=zeros(1,10000);
for i=1:10000
    In(i)=sum(convSig(1+30*(i-1):(30*i)).*I);
    Qn(i)=sum(convSig(1+30*(i-1):(30*i)).*Q);
end
figure(15)
scatter(a,b,'LineWidth',2)
hold on
scatter(In,Qn,'filled','color','red','LineWidth',1);




% Impulse Response 3
h4=[1 0 0 -0.5 0 0.4 0 0 0 0.3 0 0.1 0 0 -0.1 0];
figure(16)
plot(Q,'Color','red','LineWidth',2);
title("h4 and Q")
hold on
bar(h4,'FaceColor','blue');

% Convolve signal and Impulse Respons
convSig=conv(gensig,h4);


In=zeros(1,10000);
Qn=zeros(1,10000);
for i=1:10000
    In(i)=sum(convSig(1+30*(i-1):(30*i)).*I);
    Qn(i)=sum(convSig(1+30*(i-1):(30*i)).*Q);
end
figure(17)
scatter(a,b,'LineWidth',2)
hold on
scatter(In,Qn,'filled','color','red','LineWidth',1);

