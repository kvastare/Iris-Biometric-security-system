function varargout = new_usr_iris(varargin)
% NEW_USR_IRIS MATLAB code for new_usr_iris.fig
%      NEW_USR_IRIS, by itself, creates a new NEW_USR_IRIS or raises the existing
%      singleton*.
%
%      H = NEW_USR_IRIS returns the handle to a new NEW_USR_IRIS or the handle to
%      the existing singleton*.
%
%      NEW_USR_IRIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_USR_IRIS.M with the given input arguments.
%
%      NEW_USR_IRIS('Property','Value',...) creates a new NEW_USR_IRIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_usr_iris_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_usr_iris_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_usr_iris

% Last Modified by GUIDE v2.5 15-Mar-2018 11:13:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_usr_iris_OpeningFcn, ...
                   'gui_OutputFcn',  @new_usr_iris_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before new_usr_iris is made visible.
function new_usr_iris_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_usr_iris (see VARARGIN)

% Choose default command line output for new_usr_iris
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_usr_iris wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_usr_iris_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
set(handles.input_iris,'visible','off');
set(handles.pushbutton3,'visible','off');
varargout{1} = handles.output;



function passcode1_Callback(hObject, eventdata, handles)
% hObject    handle to passcode1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passcode1 as text
%        str2double(get(hObject,'String')) returns contents of passcode1 as a double


% --- Executes during object creation, after setting all properties.
function passcode1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passcode1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function correct_or_wrong_Callback(hObject, eventdata, handles)
% hObject    handle to correct_or_wrong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of correct_or_wrong as text
%        str2double(get(hObject,'String')) returns contents of correct_or_wrong as a double


% --- Executes during object creation, after setting all properties.
function correct_or_wrong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to correct_or_wrong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input_iris.
function input_iris_Callback(hObject, eventdata, handles)
% hObject    handle to input_iris (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename1 pathname] = uigetfile({'*.bmp'},'File Selector');
image = strcat(pathname, filename1);


[Template, Mask]=createiristemplate(image);

[string] = getappdata(0,'evalue');
usr_string = string(6:end)

if (~mkdir('user_data'))
    mkdir('user_data')
end
cd ./user_data
if (~mkdir(usr_string))
    mkdir(usr_string)
end

path1 = ['./' usr_string]
cd(path1)
filename_template = [usr_string,'template.mat'];
filename_mask = [usr_string,'mask.mat'];

save(filename_template,'Template');
save(filename_mask,'filename1');
cd ../..
set(handles.status, 'String', 'Done!');
set(handles.pushbutton3,'visible','on');














% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[string] = getappdata(0,'evalue')
OTP_string = string(1:5)
passcode_str = get(handles.passcode1,'String')

if (OTP_string == passcode_str)
    % display success in the edit field and show the button
    set(handles.correct, 'String', 'Now you may enter the iris input');
    set(handles.input_iris,'visible','on');
else
    % display failure
    close(new_usr_iris);
    run('new_usr_email');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(new_usr_iris);
run('iris_main');

