% String‚ð‘ã“ü

function path_string = make_path_presen_3()
filename = ('DESFILE_TEST\SUP_presen_3.txt');
fileID = fopen(filename);
move = textscan(fileID,'%s','Delimiter',{',','[',']'});
path_string = str2double(move{1,1});
end