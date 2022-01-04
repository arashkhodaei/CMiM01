clear all;
theta2 = 0:0.1:(8*pi);
len = length(theta2);
r4=0;r2=0.8;r3=2.5;
for i=1:len
    theta3(i) = asin( (r4-r2*sin(theta2(i))) / r3);
    r1(i) = r2*cos(theta2(i)) + r3*cos(theta3(i));
    
    plot([0 r2*cos(theta2(i))], [0 r2*sin(theta2(i))],'ro-','LineWidth',5);hold on;
    plot([r2*cos(theta2(i)) r2*cos(theta2(i))+r3*cos(theta3(i))], [r2*sin(theta2(i)) r4], 'go-','LineWidth',5); hold on;
    plot([r2*cos(theta2(i))+r3*cos(theta3(i)) 3], [r4 r4], 'bo-','LineWidth',5); hold off;
    grid on
    axis([-2 5 -2 2]);
    pause(0.1);
end
subplot(1,2,1)
plot(rad2deg(theta2),rad2deg(theta3));
title(' Coupler rotation ')
xlabel('\theta2')
ylabel('\theta3')
grid on
subplot(1,2,2)
plot(rad2deg(theta2),(r1));
title(' Slider displacement ')
xlabel('\theta2')
ylabel('c')
grid on
[t,y] = ode45(@vdp1,[0 20],[2; 0]);
plot(t,y(:,1),'-o',t,y(:,2),'-o')
title('Solution of van der Pol Equation (\mu = 1) with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1','y_2')
function dydt = vdp1(t,y)


dydt = [y(2); (1-y(1)^2)*y(2)-y(1)]
end

