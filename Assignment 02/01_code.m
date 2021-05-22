fileName={'new1.txt', 'new2.txt', 'new3.txt'};
%open file identifier
fid=fopen('MyFile.txt','w');
for k=1:length(fileName)
    %read the file name as string including delimiters and next lines
    List=textread(fileName{1,k},'%s','delimiter','\n');
    %arrange them in order of k if you want in a cell array
    FinalList{k,1}=List;
    %or print them into a file.
    fprintf(fid, [cell2mat(List)  '\n']);
end
%close file indentifier
fclose(fid)