close all

% Variables
pCa_values = [4.5, 6.1, 6.2, 6.4, 9.0];
prots = 5:-1:1;

for j = 1:length(pCa_values)

% load MATMyoSim output
load([MATMyoSim_path,'\code\demos\horslen_ramps\temp\sim_output\',num2str(pCa_values(j)*10),'\results_',num2str(pCa_values(j)*10),'.myo'],'-mat')

% load cMyoSim output
cMyoSim_output = readmatrix([cMyoSim_path,'\progress\1\sim_prot_',num2str(prots(j)),'_1_r1.txt']);

figure(1);
color = get(gca,'colororder');

subplot(2,4,1:4);
plot(sim_output.time_s, sim_output.muscle_force,'color',color(j,:)); hold on
plot(cMyoSim_output(:,1), cMyoSim_output(:,3),'--','color',color(j,:));

ylabel('Force (N m^{-2})');
legend('MATMyoSim','cMyoSim','location','best')
title('Force')
box off
xlim([0 1.2])
xlabel('Time (s)')

subplot(245)
plot(sim_output.time_s,sim_output.M1,'color',color(j,:)); hold on
plot(cMyoSim_output(:,1), cMyoSim_output(:,end-3),'--','color',color(j,:))
title('SRX')
box off
xlim([0 1.2])
xlabel('Time (s)')

subplot(246)
plot(sim_output.time_s,sim_output.M2,'color',color(j,:)); hold on
plot(cMyoSim_output(:,1), cMyoSim_output(:,end-2),'--','color',color(j,:))
title('DRX')
box off
xlim([0 1.2])
xlabel('Time (s)')

subplot(247)
plot(sim_output.time_s,sim_output.M3,'color',color(j,:)); hold on
plot(cMyoSim_output(:,1), cMyoSim_output(:,end-1),'--','color',color(j,:))
title('Pre-stroke')
box off
xlim([0 1.2])
xlabel('Time (s)')

subplot(248)
plot(sim_output.time_s,sim_output.M4,'color',color(j,:)); hold on
plot(cMyoSim_output(:,1), cMyoSim_output(:,end-0),'--','color',color(j,:))
title('Post-stroke')
box off 
xlim([0 1.2])
xlabel('Time (s)')


    figure(2)

    id = sim_output.time_s < 0.85;
    plot(sim_output.hs_length(id), sim_output.hs_force(id)/1000,'color',color(j,:)); hold on
    
    id = cMyoSim_output(:,1) < 0.85;
    plot(cMyoSim_output((id),7), cMyoSim_output((id),3)/1000,'--','color',color(j,:))
    
    xlabel('hs length (nm)'); 
    ylabel('hs force (kPa)')

end