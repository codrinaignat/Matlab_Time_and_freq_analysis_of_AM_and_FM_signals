function varargout = untitled(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('radio-antenna.png'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)


function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)


function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)


function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)

function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function popupmenu1_Callback(hObject, eventdata, handles)

a = get(handles.edit1,'string');
Am = str2num(a);
b = get(handles.edit2,'string');
fm = str2num(b);
c = get(handles.edit4,'string');
Ac = str2num(c);
d = get(handles.edit5,'string');
fc = str2num(d);

fs = 40001;     %frecventa de esantionare
Ts = 1/fs;     %Perioada de esantionare
durata = 0.1;
N = 20000;   %Numar de esantioane
%t = 0: Ts : durata;
t = 0: Ts :N*Ts-Ts;
%f = [-fs/2:fs/N:fs/2-fs/N]; 

%axa frecventei
m = 1; %indicele de modulatie
Semnal_purtator=Ac*sin(2*pi*fc*t);

Semnal_modulator = get(handles.popupmenu2,'value')
switch Semnal_modulator
    case 1
        Semnal_modulator=sin(2*pi*fm*t);
    case 2
        Semnal_modulator=square(2*pi*fm*t);
    case 3
        Semnal_modulator=sawtooth(2*pi*fm*t);
    case 4
        Semnal_modulator=sin(2*pi*fm*t)+10*sin(2*pi*10*fm*t)+100*sin(2*pi*100*fm*t);

end

ModulatAM = (Ac*(1+m*Semnal_modulator)).*sin(2*pi*fc*t);
SpectruSemnalAM = fft(ModulatAM);


IndiceModFM = 10; 
%ModulatFM = Ac*sin(2*pi*fc*t + IndiceModFM.*cos(2*pi*fm*t));
ModulatFM = Ac*sin(2*pi*fc*t + IndiceModFM.*Semnal_modulator);
SpectruSemnalFM = fft(ModulatFM); 


DemodulatAM = amdemod(ModulatAM, fc, fs, 1);

DemodulatFM = fmdemod(ModulatFM, fc, fs, 1); 


Zgomot = 2*randn(size(ModulatAM));
SemnalAMcuzgomot = ModulatAM + Zgomot;  

ZgomotFM = 2*randn(size(ModulatFM));
SemnalFMcuzgomot = ModulatFM + ZgomotFM;


k = get(handles.popupmenu1,'value')
switch k
    case 1
         %semnal modulator
         plot(t,Am*Semnal_modulator);
         xlabel('t');
         ylabel('Amplitudine [V]');
         zoom on
    case 2
         %Semnal purtator
         plot(t,Semnal_purtator);
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 3
         %Semnal AM
         plot(t,ModulatAM);
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 4 
         %Semnal AM cu zgomot
         plot(t,SemnalAMcuzgomot);
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 5
         %Spectrul semnalului AM
         axa1 = linspace(-fs/2, fs/2, length(ModulatAM)); 
         AM = abs(fftshift(fft(ModulatAM))); 
         plot(axa1, AM);
    case 6
         %Semnal demodulat AM
         plot(t, DemodulatAM);
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 7
         %Spectrul semnalului demodulat AM
         axa2 = linspace(-fs/2, fs/2, length(DemodulatAM)); 
         DAM = abs(fftshift(fft(DemodulatAM))); 
         plot(axa2, DAM);
         xlabel("f(Hz)")
         ylabel("Magnitudine");
    case 8
         %Semnal FM
         plot(t,ModulatFM);
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 9
         %Semnal FM cu zgomot
         plot(t,SemnalFMcuzgomot);
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 10
         %Spectrul semnalului FM
         axa3 = linspace(-fs/2, fs/2, length(ModulatFM)); 
         FM = abs(fftshift(fft(ModulatFM))); 
         plot(axa3, FM);
         xlabel("f(Hz)")
         ylabel("Magnitudine");
    case 11
         %Semnal demodulat FM
         plot(t, DemodulatFM); 
         xlabel('t');
         ylabel('Amplitudine [V]');
    case 12 
         %Spectrul semnalului demodulat FM
         axa4 = linspace(-fs/2, fs/2, length(DemodulatFM));
         DFM = abs(fftshift(fft(DemodulatFM))); 
         plot(axa4, DFM); 
         xlabel("f(Hz)")
         ylabel("Magnitudine");
end


function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)

function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenu2_Callback(hObject, eventdata, handles)





function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
Info_button;


% --- Executes during object creation, after setting all properties.
function text13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
imshow('radio-antenna.png');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
