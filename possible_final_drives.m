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

for i = final_drive
    output=Lap_Sim_CSAPS_Func('finalDrive', i);
end


% makes a noise when the simulation finishes because I'm testing this in the
% background
filename = 'microwave-beep.wav';
[y,Fs]=audioread(filename);
sound(y,Fs)