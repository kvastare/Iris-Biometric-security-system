function varargout = new_usr_email(varargin)
% NEW_USR_EMAIL MATLAB code for new_usr_email.fig
%      NEW_USR_EMAIL, by itself, creates a new NEW_USR_EMAIL or raises the existing
%      singleton*.
%
%      H = NEW_USR_EMAIL returns the handle to a new NEW_USR_EMAIL or the handle to
%      the existing singleton*.
%
%      NEW_USR_EMAIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_USR_EMAIL.M with the given input arguments.
%
%      NEW_USR_EMAIL('Property','Value',...) creates a new NEW_USR_EMAIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_usr_email_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_usr_email_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_usr_email

% Last Modified by GUIDE v2.5 15-Mar-2018 01:42:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_usr_email_OpeningFcn, ...
                   'gui_OutputFcn',  @new_usr_email_OutputFcn, ...
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


% --- Executes just before new_usr_email is made visible.
function new_usr_email_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_usr_email (see VARARGIN)

% Choose default command line output for new_usr_email
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_usr_email wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_usr_email_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

usr_name_str = get(handles.usr_name,'String'); %edit1 being Tag of ur edit box
 if isempty(usr_name_str)
   fprintf('Error: Enter Text first\n');
 end
 
usr_email_str = get(handles.email_id,'String'); %edit1 being Tag of ur edit box
 if isempty(usr_name_str)
   fprintf('Error: Enter Text first\n');
 end
   
 mail = 'iris.biometric.identification@gmail.com'; %Your GMail email address
password = 'Qwerty!234';  %Your GMail password
setpref('Internet','SMTP_Server','smtp.gmail.com');
 
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');


s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

%find number of random characters to choose from
numRands = strlength(s); 

%specify length of random string to generate
sLength = 5;

%generate random string
OTP_string = s( ceil(rand(1,sLength)*numRands) );

setappdata(0,'evalue',strcat(OTP_string,usr_name_str));

sendmail(usr_email_str,'Welcome to Iris Biometric Identification system', ['Dear ' usr_name_str ',' 10 10 'Your OTP: ' OTP_string 10 'Please enter this string in your next GUI window' 10 10 'Thanks,' 10 'Iris Biometric Authentication Team']);
 
close(new_usr_email);
run('new_usr_iris');


function usr_name_Callback(hObject, eventdata, handles)
% hObject    handle to usr_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of usr_name as text
%        str2double(get(hObject,'String')) returns contents of usr_name as a double

% --- Executes during object creation, after setting all properties.
function usr_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to usr_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function email_id_Callback(hObject, eventdata, handles)
% hObject    handle to email_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of email_id as text
%        str2double(get(hObject,'String')) returns contents of email_id as a double


% --- Executes during object creation, after setting all properties.
function email_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to email_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
