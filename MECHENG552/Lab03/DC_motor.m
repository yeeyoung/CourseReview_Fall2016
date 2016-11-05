% ME 552 Lab 3 
% DC motor
%% position step response
% clear
% clf
% SYS = 'DC_motor_position';
% SYS = 'motorServoSystem';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:10;
% 
% in(1:1000) = zeros(1000,1);
% in(1001:length(t)) = 1*ones(1,length(t)-1000);
% UT = [t' zeros(length(t),1) zeros(length(t),1) in'];
% 
% [t,x,y] = sim(SYS,t,options,UT);
% 
% figure(1);
% subplot(2,1,1)
% plot(t,y(:,1),'g',t,in,'--k','LineWidth',1)
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Position Step Response(step input),Encoder Resolution =  0.00314 rad')
% xlabel('time(s)')
% ylabel('Theta(radian)')
% legend('output','reference')
% 
% subplot(2,1,2)
% plot(t,y(:,2),'k')
% axis([0 5 -0.05 0.09])
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Position Error(step input),Encoder Resolution =  0.00314 rad')
% xlabel('time(s)')
% ylabel('delta_Theta(radian)')
% 
% % position sinep(5Hz) response
% % clear
% % clf
% SYS = 'motorServoSystem';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:10;
% 
% in = pi*sin(2*pi*5*t);
% UT = [t' zeros(length(t),1) zeros(length(t),1) in'];
% 
% [t,x,y] = sim(SYS,t,options,UT);
% 
% figure(2);
% subplot(2,1,1)
% plot(t,y(:,1),'g',t,in,'--k','LineWidth',1)
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Position Sinusiod Response(sine input),Encoder Resolution =  0.00314 rad')
% xlabel('time(s)')
% ylabel('v(radian)')
% legend('output','reference')
% 
% subplot(2,1,2)
% plot(t,y(:,2),'k')
% axis([0 5 -0.3 0.31])
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Position Error(sine input),Encoder Resolution =  0.00314 rad')
% xlabel('time(s)')
% ylabel('v(radian)')
% 
%% attenuate 60Hz noise
SYS = 'motorServoSystem';
options = simset('MaxStep',0.0001);
t = 0:0.001:10;

ns = 0.1*sin(2*pi*200*t);
UT_sens = [t' ns' zeros(length(t),1) zeros(length(t),1)];

[t,x,y] = sim(SYS,t,options,UT_sens);

figure(3);
subplot(2,1,1);
plot(t,y(:,1),'r',t,ns,':k','LineWidth',1)
axis([0 5 -0.15 0.151])
grid on
set(gca,'fontsize',14)
title('DC Motor Position Due to Sensor Noise, 60 Hz')
xlabel('time(s)')
ylabel('x(radian)')
legend('output due to noise','noise')

subplot(2,1,2)
ratio = ns'./y(:,1);
plot(t,ratio,'k-')

grid on
set(gca,'fontsize',14)
title('DC Motor Position Sensor noise ratios of reduction(sine input),Encoder Resolution =  0.00314 rad')
xlabel('time(s)')
ylabel('ratio(-)')
axis([0 5 -20 20])
% 
% %% attenuate 60Hz input disturbance
% clear
% clf
% SYS = 'DC_motor_position';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:10;
% 
% ds = 0.1*sin(2*pi*60*t);
% UT_sens = [t' zeros(length(t),1) ds' zeros(length(t),1)];
% 
% [t,x,y] = sim(SYS,t,options,UT_sens);
% 
% plot(t,y(:,1),'r',t,ds,':k','LineWidth',1)
% axis([0 1 -0.11 0.111])
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Position Due to Input Disturbance','fontsize',14)
% xlabel('time(s)')
% ylabel('x(radian)')
% legend('output due to input disturbance','disturbance')
% 
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%% step above %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%% velocity below %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% velocity step response

% clf

% SYS = 'motorServoSystem';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:5;
% 
% in(1:300) = zeros(300,1);
% in(301:length(t)) = 2*pi*ones(1,length(t)-300);
% in = in';
% UT = [t' zeros(length(t),1) zeros(length(t),1) in];
% 
% [t,x,y] = sim(SYS,t,options,UT);
% 
% subplot(2,1,1)
% plot(t,y(:,1),'k',t,in,':r')
% grid on
% set(gca,'fontsize',14)
% % axis([0 5 0 7])
% title('DC Motor Velocity Step Response')
% xlabel('time(s)')
% ylabel('v(radian/s)')
% legend('output','reference')
% 
% subplot(2,1,2)
% plot(t,y(:,2),'k')
% axis([0 5 -0.2 0.2])
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Error(step input)')
% xlabel('time(s)')
% ylabel('v(radian/s)')
% 
% %% velocity sine(5Hz) response
% clear
% clf
% SYS = 'motorServoSystem';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:5;
% 
% in = pi/2*sin(2*pi*5*t);
% UT = [t' zeros(length(t),1) zeros(length(t),1) in'];
% 
% [t,x,y] = sim(SYS,t,options,UT);
% 
% subplot(2,1,1)
% plot(t,y(:,1),'k',t,in,':r')
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Sinusiod Response')
% xlabel('time(s)')
% ylabel('v(radian/s)')
% legend('output','reference')
% 
% subplot(2,1,2)
% plot(t,y(:,2),'k')
% axis([0 5 -0.1 0.1])
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Error(sin input)')
% xlabel('time(s)')
% ylabel('v(radian/s)')
% 
% %% attenuate 60Hz noise
% SYS = 'motorServoSystem';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:10;
% 
% ns = 0.1*sin(2*pi*60*t);
% UT_sens = [t' ns' zeros(length(t),1) zeros(length(t),1)];
% 
% [t,x,y] = sim(SYS,t,options,UT_sens);
% 
% subplot(2,1,1);
% plot(t,y(:,1),'r',t,ns,':k','LineWidth',1)
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Due to Sensor Noise')
% xlabel('time(s)')
% ylabel('v(radian)')
% axis([0 5 -0.1 0.1])
% legend('output due to noise','noise')
% 
% subplot(2,1,2)
% ratio = ns'./y(:,1);
% plot(t,ratio,'k')
% axis([0 5 -5 5])
% grid on
% set(gca,'fontsize',14)
% title('Sensor noise ratio of reduction ')
% xlabel('time(s)')
% ylabel('v(radian/s)')

% 
% %% attenuate 60Hz input disturbance
% SYS = 'DC_motor_velocity';
% options = simset('MaxStep',0.0001);
% t = 0:0.001:10;
% 
% ds = 0.1*sin(2*pi*60*t);
% UT_sens = [t' zeros(length(t),1) ds' zeros(length(t),1)];
% 
% [t,x,y] = sim(SYS,t,options,UT_sens);
% 
% plot(t,y(:,1),'r',t,ds,':k','LineWidth',1)
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Due to Input Disturbance','fontsize',14)
% xlabel('time(s)')
% ylabel('x(radian/s)')
% legend('output due to input disturbance','disturbance')
% 
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% experiment data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% velocity 
% clear
% clc
% 
% load('velocity_exp_data')
% 
% plot(t_data,v_step,'r',t_data,r_step,':k','LineWidth',1)
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity step Response','fontsize',14)
% xlabel('time(s)')
% ylabel('v(radian/s)')
% legend('output','reference')
% 
% figure
% plot(t_data,e_step,'k')
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Error(step input)','fontsize',14)
% xlabel('time(s)')
% ylabel('v(radian/s)')
% 
% figure
% plot(t_data,v_sin,'r',t_data,r_sin,':k','LineWidth',1)
% set(gca,'fontsize',14)
% title('DC Motor Velocity Sinusiod Response','fontsize',14)
% xlabel('time(s)')
% ylabel('v(radian/s)')
% legend('output','reference')
% 
% figure
% plot(t_data,e_sin,'k')
% grid on
% set(gca,'fontsize',14)
% title('DC Motor Velocity Error(sin input)','fontsize',14)
% xlabel('time(s)')
% ylabel('v(radian/s)')
































