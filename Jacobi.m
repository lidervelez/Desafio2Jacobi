A = [0.52 0.2 0.25;
     0.3  0.5 0.2;
     0.18 0.3 0.55];
b = [4800; 5810; 5690];
n = length(b);
x = zeros(n, 1); % Inicialización de x con ceros
x_old = x; % Guardamos la solución anterior
max_iter = 17; % Número máximo de iteraciones
tol = 1e-6; % Tolerancia para el criterio de convergencia

for k = 1:max_iter
    for i = 1:n
        % Calculamos la suma de los términos que no son xi
        sum1 = A(i, 1:i-1) * x_old(1:i-1);
        sum2 = A(i, i+1:n) * x_old(i+1:n);

        % Actualizamos xi
        x(i) = (b(i) - sum1 - sum2) / A(i, i);
    end

    % Verificamos la convergencia
    if norm(x - x_old, inf) < tol
        break;
    end

    % Actualizamos x_old
    x_old = x;
end

disp('La solución es:');
disp(x);
