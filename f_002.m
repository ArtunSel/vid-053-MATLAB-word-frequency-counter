%% WORD COUNTER - WORD FREQUENCY COUNTER
clear all,close all,clc;
% the three body problem.txt
%% get the text data and load it to a string variable
% fileID = fopen('the three body problem.txt','rt');
fileID = fopen('file_1.txt','rt');
% A = fread(fileID)
A = fscanf(fileID,'%c'); % abcdefghijklmnopqrstuvwxyz 
fclose(fileID)
% type file_1.txt
%% eliminate all the "space","comma","period","semicolon", etc
class(A)
size(A)
% A=A((double(A)>=65 & double(A)<=90) | (double(A)>=72 & double(A)<=122));
A(~((double(A)>=65 & double(A)<=90) | (double(A)>=97 & double(A)<=122)))=" ";
A=string(A);
A = lower(A);
size(A)
% "marry has a little lamb. john has a pencil."
% "marry has a little lamb  john has a pencil "
% "marry" "has" "a" "little" "lamb" "john" "has" "a" "pencil"
newStr = strsplit(A,[" "]); % [" ",".","\n"]
size(newStr)
newStr = unique(newStr);
size(newStr)
for ii=length(newStr):-1:1
    if newStr(ii)=="" % | newStr(ii)=="aaa"
        newStr(ii)=[];
    end
end
size(newStr)
%% create a list
list1=[];
list2=[];
for ii=1:1:length(newStr)
    t1=count(A,newStr(ii));
    t1=sum(t1);
    list1=[list1;[newStr(ii),num2str(t1)]];
    list2=[list2;t1];
end
% list1 length(list1)
%% create a txt file and write this list into that txt file
fileID = fopen('word_list.txt','wt');
for ii=1:1:size(list1,1)
    fprintf(fileID,' %s\t\t\t%d\n',list1(ii,1),list2(ii));
end
% fprintf(fileID,'%s %s\n',list1)
fclose(fileID)
% type word_list.txt
%% table study
AA=rand(5,2)
col1=AA(:,1);
col2=AA(:,2);
T1=table(col1,col2)
%% table study
col1=list1(:,1);
col2=list2;
T1=table(col1,col2);
T1.Properties.VariableNames{1}='word';
T1.Properties.VariableNames{2}='count';
% T1.word
% T1.count
%% order the words by count
[E,~] = sortrows(T1,2,'descend');
%% export it as a txt file
writetable(E,'word_list.txt','Delimiter',' '); 
% type 'word_list.txt'
%% export it as a csv file
writetable(E,'word_list.csv','Delimiter',',');
% type 'word_list.csv'








%