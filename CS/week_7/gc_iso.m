function [x,res,k,resv]=gc_iso(a,b,x0,tol,kmax)
    % Metodo del gradiente coniugato  con disegno delle iterate e delle isolinee
    %
    % E' una function di tipo didattico, funziona per sistemi 2x2
    %
    % [x,res,k,resv]=gc_iso(a,b,x0,tol,kmax)
    
    %
    x=x0;
    
    [n,m]=size(a);
    xmin=-55;xmax=55;
    ymin=-55;ymax=55;
    % disegno le isolinee e le direzioni di discesa
    xx=a\b;
    h=.5;
    xr=xmin:h:xmax;
    yr=ymin:h:ymax;
    [x1,y]=meshgrid(xr,yr);
    z=0.5*(a(1,1)*x1.^2+2*a(1,2)*x1.*y+a(2,2)*y.^2)-b(1)*x1-b(2)*y;
    f=@(x,y)0.5*(a(1,1)*x.^2+2*a(1,2)*x.*y+a(2,2)*y.^2)-b(1)*x-b(2)*y;
    %xx1=x(1);yy1=x(2);
    f0=f(x(1),x(2));
    
    % contour
    figure(1);clf
    axis([xmin,xmax,ymin,ymax])
    axHndl=gca;
    set(axHndl, ...
      'XLim',[xmin xmax],'YLim',[ymin ymax], ...
      'View',[0,90]);
    axis equal
    xlabel('x');
    ylabel('y');
    contour(x1,y,z,50)
    title('isolinee del paraboloide $\Phi(x)$','Interpreter','latex');
    fprintf('\n Si risolve ora il sistema lineare con il metodo del GRADIENTE\n ')
    disp('Premere un tasto per continuare')
    axis equal
    pause
    hold on
    plot(x(1),x(2),'mo','Markerfacecolor','m','MarkerSize',6);
    
    pause
    contour(x1,y,z,[f0,f0],'m--','Linewidth',1)
    pause
    %axis equal
    r=b-a*x;
    d=r;
    bb=norm(b,2);
    k=0;
    res=norm(r)/bb;
    resv=res;
    while k<kmax && res> tol
      v=a*d;
      alpha=d'*r/(d'*v);
      %
      %plot(x(1),x(2),'mo','Markerfacecolor','m','MarkerSize',6);
      xv=x;
      %
      x=x+alpha*d;
      %
        z=0.5*(a(1,1)*x1.^2+2*a(1,2)*x1.*y+a(2,2)*y.^2)-b(1)*x1-b(2)*y;
        f0=f(x(1),x(2));
        plot([x(1),xv(1)],[x(2),xv(2)],'m','Linewidth',2);
        plot(x(1),x(2),'mo','MarkerSize',6,'Markerfacecolor','m');
        %axis equal
        pause(1)
        contour(x1,y,z,[f0,f0],'m--','Linewidth',1)
        %axis equal
        pause(1)
      %
      r=r-alpha*v;
      beta=(v'*r)/(d'*v);
      d=r-beta*d;
      res=norm(r,2)/bb;
      resv=[resv;res];
      k=k+1;
    end
    fprintf('\n Il metodo del GRADIENTE e` arrivato a convergenza in %3g ',k)
    fprintf('iterazioni,\n fissata la tolleranza = %6.3g\n', tol)
return
