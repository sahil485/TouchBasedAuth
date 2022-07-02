clc; clear; close all;

time_start = cputime;
%% Set Parameters


p1a = load('p1/Galaxy_Office_L.mat');
p2a = load('p2/Galaxy_Office_L.mat');
p1b = load('p1/Galaxy_Office_R.mat');
p2b = load('p2/Galaxy_Office_R.mat');

% Load Data First if Workspace Cleared
person = [p1a p2a ...
          p1b p2b ];
%% Create table for user samples
% Based on experiment parameters, maximum 400 sampled chirps per person
chirps_for_train = 400; % this number should be a multiple of 10 b/c 10 chirps per sample

master_data = []; % chirps_for_train * number of users = size of master_data

for i = 1:length(person)
   %for i = 1:18
    t_data = array2table(person(i).person.features()');
    %disp(t_data)
    % We append to the features table the label of the person, i.e. P1
    % Cellstr repeats the label for some number of rows and 1 column
    p_label = array2table(cellstr(repmat(['P' num2str(i)],chirps_for_train,1)),'VariableNames',{'Person'});
    table_test = label_table_data([t_data p_label]);
    
    master_data = [master_data; table_test]; 
end

disp('Compiled Master Data');


%% Functions
function table = label_table_data(table)
table.Properties.VariableNames = {...
    'Average'...
    'Std'...
    'Max'...
    'Min'...
    'Range'...
    'Variance'...
    'Peak_Change'...
    'Q1'...
    'Q2'...
    'Q3'...
    'Q4'...
    'Skew'...
    'Kurotsis'...
    'FFT_1'...
    'FFT_2'...
    'FFT_3'...
    'FFT_4'...
    'FFT_5'...
    'FFT_6'...
    'FFT_7'...
    'FFT_8'...
    'FFT_9'...
    'FFT_10'...
    'FFT_11'...
    'FFT_12'...
    'FFT_13'...
    'FFT_14'...
    'FFT_15'...
    'FFT_16'...
    'FFT_17'...
    'FFT_18'...
    'FFT_19'...
    'FFT_20'...
    'FFT_21'...
    'FFT_22'...
    'FFT_23'...
    'FFT_24'...
    'FFT_25'...
    'FFT_26'...
    'FFT_27'...
    'FFT_28'...
    'FFT_29'...
    'FFT_30'...
    'FFT_31'...
    'FFT_32'...
    'FFT_33'...
    'FFT_34'...
    'FFT_35'...
    'FFT_36'...
    'FFT_37'...
    'FFT_38'...
    'FFT_39'...
    'FFT_40'...
    'FFT_41'...
    'FFT_42'...
    'FFT_43'...
    'FFT_44'...
    'FFT_45'...
    'FFT_46'...
    'FFT_47'...
    'FFT_48'...
    'FFT_49'...
    'FFT_50'...
    'FFT_51'...
    'FFT_52'...
    'FFT_53'...
    'FFT_54'...
    'FFT_55'...
    'FFT_56'...
    'FFT_57'...
    'FFT_58'...
    'FFT_59'...
    'FFT_60'...
    'FFT_61'...
    'FFT_62'...
    'FFT_63'...
    'FFT_64'...
    'FFT_65'...
    'FFT_66'...
    'FFT_67'...
    'FFT_68'...
    'FFT_69'...
    'FFT_70'...
    'FFT_71'...
    'FFT_72'...
    'FFT_73'...
    'FFT_74'...
    'FFT_75'...
    'FFT_76'...
    'FFT_77'...
    'FFT_78'...
    'FFT_79'...
    'FFT_80'...
    'FFT_81'...
    'FFT_82'...
    'FFT_83'...
    'FFT_84'...
    'FFT_85'...
    'FFT_86'...
    'FFT_87'...
    'FFT_88'...
    'FFT_89'...
    'FFT_90'...
    'FFT_91'...
    'FFT_92'...
    'FFT_93'...
    'FFT_94'...
    'FFT_95'...
    'FFT_96'...
    'FFT_97'...
    'FFT_98'...
    'FFT_99'...
    'FFT_100'...
    'FFT_101'...
    'FFT_102'...
    'FFT_103'...
    'FFT_104'...
    'FFT_105'...
    'FFT_106'...
    'FFT_107'...
    'FFT_108'...
    'FFT_109'...
    'FFT_110'...
    'FFT_111'...
    'FFT_112'...
    'FFT_113'...
    'FFT_114'...
    'FFT_115'...
    'FFT_116'...
    'FFT_117'...
    'FFT_118'...
    'FFT_119'...
    'FFT_120'...
    'FFT_121'...
    'FFT_122'...
    'FFT_123'...
    'FFT_124'...
    'FFT_125'...
    'FFT_126'...
    'FFT_127'...
    'FFT_128'...
    'FFT_129'...
    'FFT_130'...
    'FFT_131'...
    'FFT_132'...
    'FFT_133'...
    'FFT_134'...
    'FFT_135'...
    'FFT_136'...
    'FFT_137'...
    'FFT_138'...
    'FFT_139'...
    'FFT_140'...
    'FFT_141'...
    'FFT_142'...
    'FFT_143'...
    'FFT_144'...
    'FFT_145'...
    'FFT_146'...
    'FFT_147'...
    'FFT_148'...
    'FFT_149'...
    'FFT_150'...
    'FFT_151'...
    'FFT_152'...
    'FFT_153'...
    'FFT_154'...
    'FFT_155'...
    'FFT_156'...
    'FFT_157'...
    'FFT_158'...
    'FFT_159'...
    'FFT_160'...
    'FFT_161'...
    'FFT_162'...
    'FFT_163'...
    'FFT_164'...
    'FFT_165'...
    'FFT_166'...
    'FFT_167'...
    'FFT_168'...
    'FFT_169'...
    'FFT_170'...
    'FFT_171'...
    'FFT_172'...
    'FFT_173'...
    'FFT_174'...
    'FFT_175'...
    'FFT_176'...
    'FFT_177'...
    'FFT_178'...
    'FFT_179'...
    'FFT_180'...
    'FFT_181'...
    'FFT_182'...
    'FFT_183'...
    'FFT_184'...
    'FFT_185'...
    'FFT_186'...
    'FFT_187'...
    'FFT_188'...
    'FFT_189'...
    'FFT_190'...
    'FFT_191'...
    'FFT_192'...
    'FFT_193'...
    'FFT_194'...
    'FFT_195'...
    'FFT_196'...
    'FFT_197'...
    'FFT_198'...
    'FFT_199'...
    'FFT_200'...
    'FFT_201'...
    'FFT_202'...
    'FFT_203'...
    'FFT_204'...
    'FFT_205'...
    'FFT_206'...
    'FFT_207'...
    'FFT_208'...
    'FFT_209'...
    'FFT_210'...
    'FFT_211'...
    'FFT_212'...
    'FFT_213'...
    'FFT_214'...
    'FFT_215'...
    'FFT_216'...
    'FFT_217'...
    'FFT_218'...
    'FFT_219'...
    'FFT_220'...
    'FFT_221'...
    'FFT_222'...
    'FFT_223'...
    'FFT_224'...
    'FFT_225'...
    'FFT_226'...
    'FFT_227'...
    'FFT_228'...
    'FFT_229'...
    'FFT_230'...
    'FFT_231'...
    'FFT_232'...
    'FFT_233'...
    'FFT_234'...
    'FFT_235'...
    'FFT_236'...
    'FFT_237'...
    'FFT_238'...
    'FFT_239'...
    'FFT_240'...
    'FFT_241'...
    'FFT_242'...
    'FFT_243'...
    'FFT_244'...
    'FFT_245'...
    'FFT_246'...
    'FFT_247'...
    'FFT_248'...
    'FFT_249'...
    'FFT_250'...
    'FFT_251'...
    'FFT_252'...
    'FFT_253'...
    'FFT_254'...
    'FFT_255'...
    'FFT_256'...    
    'MFCC_1'...
    'MFCC_2'...
    'MFCC_3'...
    'MFCC_4'...
    'MFCC_5'...
    'MFCC_6'...
    'MFCC_7'...
    'MFCC_8'...
    'MFCC_9'...
    'MFCC_10'...
    'MFCC_11'...
    'MFCC_12'...
    'MFCC_13'...
    'FBE_1'...
    'FBE_2'...
    'FBE_3'...
    'FBE_4'...
    'FBE_5'...
    'FBE_6'...
    'FBE_7'...
    'FBE_8'...
    'FBE_9'...
    'FBE_10'...
    'FBE_11'...
    'FBE_12'...
    'FBE_13'...
    'FBE_14'...
    'FBE_15'...
    'FBE_16'...
    'FBE_17'...
    'FBE_18'...
    'FBE_19'...
    'FBE_20'...
    'FBE_21'...
    'FBE_22'...
    'FBE_23'...
    'FBE_24'...
    'FBE_25'...
    'FBE_26'...
    'FBE_27'...
    'FBE_28'...
    'FBE_29'...
    'FBE_30'...
    'FBE_31'...
    'FBE_32'...
    'Window'...
    'Person'...
    };
end