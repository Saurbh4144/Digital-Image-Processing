%date - 25/01/2026 
%created by - Saurabh Singh  

clc;
clear;
close all;

A = zeros(3,9);

% Ensure no column is empty
for j = 1:9
    i = randi(3);        % random row (1–3)
    A(i,j) = 1;
end

% Ensure each row has exactly 5 ones
for i = 1:3
    while sum(A(i,:)) < 5
        j = randi(9);
        if A(i,j) == 0
            % Ensure column won't exceed 3 entries
            if sum(A(:,j)) < 3
                A(i,j) = 1;
            end
        end
    end
end

disp('Tambola Structure Matrix:');
disp(A);

T = zeros(3,9);

for j = 1:9

    % Column ranges
    if j == 1
        s = 1;    e = 9;
    elseif j == 9
        s = 80;   e = 90;
    else
        s = (j-1)*10;
        e = s + 9;
    end

    % Count numbers in this column
    c = sum(A(:,j));

    % Generate unique numbers
    v = s:e;
    v = v(randperm(length(v)));
    v = v(1:c);

    % Manual ascending sort
    for x = 1:c
        for y = 1:c-x
            if v(y) > v(y+1)
                t = v(y);
                v(y) = v(y+1);
                v(y+1) = t;
            end
        end
    end

    % Assign top to bottom
    k = 1;
    for i = 1:3
        if A(i,j) == 1
            T(i,j) = v(k);
            k = k + 1;
        end
    end
end

disp('Final Tambola Ticket:');
disp(T);
