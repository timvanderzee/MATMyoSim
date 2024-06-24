% load MATMyoSim output
load([MATMyoSim_path,'\code\temp\horslen_ramp_output.myo'],'-mat')

% load cMyoSim output
cMyoSim_output = readmatrix([cMyoSim_path,'\progress\1\sim_prot_5_1_r1.txt']);

clf
figure(1);
color = get(gca,'colororder');

subplot(121);
plot(sim_output.time_s, sim_output.muscle_force); hold on
plot(cMyoSim_output(:,1), cMyoSim_output(:,3),'--','color',color(1,:));

ylabel('Force (N m^{-2})');
legend('MATMyoSim','cMyoSim','location','best')
title('Forces')

subplot(122)
plot(sim_output.time_s,[sim_output.M1 sim_output.M2 sim_output.M3 sim_output.M4]); hold on

for i = 1:4
    d = 4-i;
    plot(cMyoSim_output(:,1), cMyoSim_output(:,end-d),'--','color',color(i,:))
end

xlim([0 1.2])
legend('SRX','DRX','Pre stroke','Post stroke','location','best')
title('States')

for i = 1:2
    subplot(1,2,i)
    xlim([0 1.2])
    box off
    xlabel('Time (s)')
end

