function circumcenter
% 判斷外心是否在三角形內

axis([-1,1,-1,1])
hold on
[x,y]=ginput(3);
plot(x,y,'o')
plot([x(1),x(2)],[y(1),y(2)],[x(2),x(3)],[y(2),y(3)],[x(1),x(3)],[y(1),y(3)])
hold on
if((x(1)==x(2)&x(2)==x(3))|(y(1)==y(2)&y(2)==y(3))|(y(2)-y(1))/(x(2)-x(1))==(y(3)-y(2))/(x(3)-x(2)))
    disp("這是一條直線，不要鬧了！")
else
    
%------------------------------------------------------------------------------------------
N=10000;
a=linspace(-3,3,N);
%y1=-(x(2)-x(1))*(a-(x(1)+x(2))/2)/(y(2)-y(1))+(y(1)+y(2))/2; % 1和2中垂線
%y2=-(x(2)-x(3))*(a-(x(3)+x(2))/2)/(y(2)-y(3))+(y(3)+y(2))/2; % 2和3中垂線
if (y(1)==y(2))
    cx=(x(1)+x(2))/2;
    cy=-(x(2)-x(3))*((x(1)+x(2))/2-(x(3)+x(2))/2)/(y(2)-y(3))+(y(3)+y(2))/2;    
elseif (y(2)==y(3))
    cx=(x(3)+x(2))/2;
    cy=-(x(2)-x(1))*((x(3)+x(2))/2-(x(1)+x(2))/2)/(y(2)-y(1))+(y(1)+y(2))/2;
else
    y3=-(x(2)-x(1))*(a-(x(1)+x(2))/2)/(y(2)-y(1))+(y(1)+y(2))/2-(-(x(2)-x(3))*(a-(x(3)+x(2))/2)/(y(2)-y(3))+(y(3)+y(2))/2);
    % y1=y2
    
    k=0;
    for ii=1:N-1

        if(y3(ii)*y3(ii+1)<0) 
            k=k+1;
            jj=0;                     % 迭代次數
            tol = 10^(-6);            % 設定容許值
                      
            ff = 10;             % 設一個初始值
            while abs(ff) > tol  % 如果函數值大於容許值則繼續找
            
            cx=a(ii) + (a(ii+1)-a(ii)).*rand(1,1); % 隨機產生區間內一個數字
            ff = -(x(2)-x(1))*(cx-(x(1)+x(2))/2)/(y(2)-y(1))+(y(1)+y(2))/2-(-(x(2)-x(3))*(cx-(x(3)+x(2))/2)/(y(2)-y(3))+(y(3)+y(2))/2); % 計算函數值
            jj=jj+1;
                if(jj>10^8) %若迭代次數大於10^8次，則表示區間過長，給予警告
                    disp('****WARNING****')
                    disp(['Stop!! Too many iterations. ', 'Have not found x yet.'])
                   break %迭代次數過多，跳出迴圈
                end
                
            end                      
            cy=-(x(2)-x(1))*(cx-(x(1)+x(2))/2)/(y(2)-y(1))+(y(1)+y(2))/2;
        end         
    end 
end
     disp(['外心 x 座標 : ', num2str(cx)])  % 輸出外心之x值     
     disp(['外心 y 座標 : ', num2str(cy)])  % 輸出外心之y值
     plot(cx,cy,'o')
%-----------------------------------------------------------------------------------------
     if(x(1)==x(2))
    % 第1點和第2點x座標相同，需另外定義 m
    % 若第3點和原點同側則 m>0,反之 m<0
    
        if(x(1)>=cx)&(x(3)<x(1))|(x(1)<=cx)&(x(3)>x(1))
            m=2;
            n=(((y(3)-y(2))/(x(3)-x(2)))*(x(1)-x(2))+y(2)-y(1))*(((y(3)-y(2))/(x(3)-x(2)))*(cx-x(2))+y(2)-cy);
            l=(((y(1)-y(3))/(x(1)-x(3)))*(x(2)-x(3))+y(3)-y(2))*(((y(1)-y(3))/(x(1)-x(3)))*(cx-x(3))+y(3)-cy);
        else
            m=-2;
            n=(((y(3)-y(2))/(x(3)-x(2)))*(x(1)-x(2))+y(2)-y(1))*(((y(3)-y(2))/(x(3)-x(2)))*(cx-x(2))+y(2)-cy);
            l=(((y(1)-y(3))/(x(1)-x(3)))*(x(2)-x(3))+y(3)-y(2))*(((y(1)-y(3))/(x(1)-x(3)))*(cx-x(3))+y(3)-cy);
        end
        
    elseif(x(2)==x(3))
        % 第2點和第3點x座標相同，需另外定義 n
        % 若第1點和原點同側則 n>0,反之 n<0

        if(x(2)>=cx)&(x(1)<x(2))|(x(2)<=cx)&(x(1)>x(2))
            n=2;
            m=(((y(2)-y(1))/(x(2)-x(1)))*(x(3)-x(1))+y(1)-y(3))*(((y(2)-y(1))/(x(2)-x(1)))*(cx-x(1))+y(1)-cy);
            l=(((y(1)-y(3))/(x(1)-x(3)))*(x(2)-x(3))+y(3)-y(2))*(((y(1)-y(3))/(x(1)-x(3)))*(cx-x(3))+y(3)-cy);
        else
            n=-2;
            m=(((y(2)-y(1))/(x(2)-x(1)))*(x(3)-x(1))+y(1)-y(3))*(((y(2)-y(1))/(x(2)-x(1)))*(cx-x(1))+y(1)-cy);
            l=(((y(1)-y(3))/(x(1)-x(3)))*(x(2)-x(3))+y(3)-y(2))*(((y(1)-y(3))/(x(1)-x(3)))*(cx-x(3))+y(3)-cy);
        end
        
    elseif(x(1)==x(3))
        % 第1點和第3點x座標相同，需另外定義 l
        % 若第2點和原點同側則 l>0,反之l<0

        if(x(1)>=cx)&(x(2)<x(1))|(x(1)<=cx)&(x(2)>x(1))
            l=2;
            m=(((y(2)-y(1))/(x(2)-x(1)))*(x(3)-x(1))+y(1)-y(3))*(((y(2)-y(1))/(x(2)-x(1)))*(cx-x(1))+y(1)-cy);
            n=(((y(3)-y(2))/(x(3)-x(2)))*(x(1)-x(2))+y(2)-y(1))*(((y(3)-y(2))/(x(3)-x(2)))*(cx-x(2))+y(2)-cy);
        else
            l=-2;
            m=(((y(2)-y(1))/(x(2)-x(1)))*(x(3)-x(1))+y(1)-y(3))*(((y(2)-y(1))/(x(2)-x(1)))*(cx-x(1))+y(1)-cy);
            n=(((y(3)-y(2))/(x(3)-x(2)))*(x(1)-x(2))+y(2)-y(1))*(((y(3)-y(2))/(x(3)-x(2)))*(cx-x(2))+y(2)-cy);
        end
        
    else    
        m=(((y(2)-y(1))/(x(2)-x(1)))*(x(3)-x(1))+y(1)-y(3))*(((y(2)-y(1))/(x(2)-x(1)))*(cx-x(1))+y(1)-cy);
        n=(((y(3)-y(2))/(x(3)-x(2)))*(x(1)-x(2))+y(2)-y(1))*(((y(3)-y(2))/(x(3)-x(2)))*(cx-x(2))+y(2)-cy);
        l=(((y(1)-y(3))/(x(1)-x(3)))*(x(2)-x(3))+y(3)-y(2))*(((y(1)-y(3))/(x(1)-x(3)))*(cx-x(3))+y(3)-cy);
    end
     
     
     if (m>=0)&(n>=0)&(l>=0) % 均大於0表示對三條線來說均同側
            disp('The circumcenter is in the triangle.')
     else
         % 未同時滿足不等式，則原點不在三角形內
         disp('The circumcenter is "not" in the triangle.')
     end
     
end   
end