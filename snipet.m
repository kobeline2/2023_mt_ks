% for run
run('init.m')
run('main.m')

%% for save params
name = '240123sato';
m = ['mkdir ', sprintf('res/param/%s/', name)];
eval(m)
save(sprintf('res/param/%s/h', name), 'h')
save(sprintf('res/param/%s/Data', name), 'Data')
save(sprintf('res/param/%s/ParamNorm', name), 'ParamNorm')
m = ['!cp parameters.m ', sprintf('res/param/%s/', name)];
eval(m)

%% 