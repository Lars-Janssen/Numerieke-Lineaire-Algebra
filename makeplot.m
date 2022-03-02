function makeplot()
    A = hilb(11);
    h = zeros(4);
    
    [Q,R] = CGS(A);
    I = Q'*Q;
    v = zeros(10);
    for j = 2:11
        part = I(1:j,1:j);
        error = max(max(abs(tril(part,-1))));
        v(j) = error;
    end
    semilogy(v,'-*');
    hold on
    
    [Q,R] = MGSR(A);
    I = Q'*Q;
    v = zeros(10);
    for j = 2:11
        part = I(1:j,1:j);
        error = max(max(abs(tril(part,-1))));
        v(j) = error;
    end
    semilogy(v,'-or');
    
    [Q,R] = House(A);
    I = Q'*Q;
    v = zeros(10);
    for j = 2:11
        part = I(1:j,1:j);
        error = max(max(abs(tril(part,-1))));
        v(j) = error;
    end
    semilogy(v,'-dg');
    
    [Q,R] = CHQR(A);
    I = Q'*Q;
    v = zeros(10);
    for j = 2:11
        part = I(1:j,1:j);
        error = max(max(abs(tril(part,-1))));
        v(j) = error;
    end
    
    semilogy(v,'-sk');
    grid on
    ax.Linewidth = 2;

    