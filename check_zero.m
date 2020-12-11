function check_zero
% 任意給定平面上三點, 判斷原點是否在這三點所圍成的三角形內.
axis([-1,1,-1,1])
hold on
[x,y]=ginput(3);
plot(x,y,'o',0,0,'o')
%---------------------------------------------------

if x(1)==x(2)
    
    plot([x(1),x(2)],[y(1),y(2)])
    f1=x(1);
else
    a=linspace(x(1),x(2),100);
    f1=((y(2)-y(1))/(x(2)-x(1)))*(a-x(1))+y(1);
    plot(a,f1)
end

hold on
%-----------------------------------
b=linspace(x(2),x(3),100);
if x(2)==x(3)
    f2=x(1);
else
    f2=((y(3)-y(2))/(x(3)-x(2)))*(b-x(2))+y(2);
end
plot(b,f2)
hold on
%---------------------------------

if x(3)==x(1)
    c=linspace(y(3),y(1),100);
    plot(x(1),c,'o')
else
    c=linspace(x(3),x(1),100);
    f3=((y(1)-y(3))/(x(1)-x(3)))*(c-x(3))+y(3);

plot(c,f3)
end
hold on
%-------------------------------------------------------

m=(((y(2)-y(1))/(x(2)-x(1)))*(x(3)-x(1))+y(1)-y(3))*(((y(2)-y(1))/(x(2)-x(1)))*(-x(1))+y(1));
n=(((y(3)-y(2))/(x(3)-x(2)))*(x(1)-x(2))+y(2)-y(1))*(((y(3)-y(2))/(x(3)-x(2)))*(-x(2))+y(2));
l=(((y(1)-y(3))/(x(1)-x(3)))*(x(2)-x(3))+y(3)-y(2))*(((y(1)-y(3))/(x(1)-x(3)))*(-x(3))+y(3));
if (m>=0)&(n>=0)&(l>=0)
    disp('T')
else
    disp('F')
end

end