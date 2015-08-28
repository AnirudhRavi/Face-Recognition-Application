function varargout = FaceRecognitionGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FaceRecognitionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FaceRecognitionGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function FaceRecognitionGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = FaceRecognitionGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
global TrainDatabasePath;
TrainDatabasePath = uigetdir('C:\Users\anidudh\Desktop\MCDM Final PPT', 'Select training database path' );



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton2_Callback(hObject, eventdata, handles)
global TestDatabasePath;
TestDatabasePath = uigetdir('C:\Users\anidudh\Desktop\MCDM Final PPT', 'Select test database path');

function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu1_Callback(hObject, eventdata, handles)
global TestImage;
val = get(hObject,'Value');
string_list = get(hObject,'String');
TestImage = string_list{val};
  
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton3_Callback(hObject, eventdata, handles)
global TestImage; global TestDatabasePath; global TrainDatabasePath;
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage);

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);
figure('Name','Test and Equivalent Images','NumberTitle','off')
subplot(1,2,1),imshow(im);
title('Test Image');
subplot(1,2,2),imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
