%commented while I test
%{
engine_side_gears = [11,12,13,14,15,16];
diff_side_gears = [35,37,38,40,51];
count = 1;
final_drive = [];
for i = engine_side_gears
    for j = diff_side_gears
        final_drive(count)=j/i;
        count=count+1;
    end
end
%final_drive=sort(final_drive);
%}


final_drive=35/13;
count=1;
data={};

%{
fid=fopen('data.txt','w');
fprintf('count | gears | Ratio | ttl points | end points | ax points | skid points | acc points');
%}

for i = final_drive
    tic;
    [points, endurance, autocross, skidpad, acceleration]=Lap_Sim_CSAPS_Func('finalDrive', i);
    data{count,1}=count;
    data{count,2}=toc;
    data{count,3}=final_drive;
    data{count,4}=points;
    data{count,5}=endurance;
    data{count,6}=autocross;
    data{count,7}=skidpad;
    data{count,8}=acceleration;
    count=count+1;
end


% makes a noise when the simulation finishes because I'm testing this in the
% background
%{
filename = 'microwave-beep.wav';
[y,Fs]=audioread(filename);
sound(y,Fs)
%}

%fclose(fid)