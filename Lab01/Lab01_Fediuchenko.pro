%Завдання №1
%База даних перельотів на інші планети
%Факти

%Космічний корабель
%shutle(код шатлу, назва шатлу, рік побудови)
shutle(1,voyager,2050).
shutle(2,marko_polo,2042).

%Пасажир 
%passanger(код пасажиру, Ім'я пасажиру, Прізвище пасажира, По-батькові пасажира)
passanger(1,ivan,ischenko,grygorovich).
passanger(2,vasyl,marak,igorovich).
passanger(3,myshko,borulya,petrovich).
passanger(4,vadym,franko,ivanovich).
passanger(5,olesya,karas,romanivana).
passanger(6,violetta,bozhko,illyvna).

%Планета
%planet(код планети, назва)
planet(1,alko).
planet(2,falko).
planet(3,mars).

%Перельоти
%journey(код подорожі, код шатлу,код планети, код пасажира, дата подорожі)
journey(1,2,2,1,2019-11-01).
journey(2,2,2,2,2019-11-01).
journey(3,2,2,3,2019-11-01).

journey(4,1,1,4,2019-11-02).
journey(5,1,1,5,2019-11-02).
journey(6,1,1,6,2019-11-02).

journey(7,2,3,4,2019-11-03).
journey(8,2,3,5,2019-11-03).
journey(9,2,3,6,2019-11-03).

%Правила
%1)Назва шатлу - Sname на котрому летить пасажир з прізвищем - LastNP, у дату Date
find_transport(Sname,LastNP,Date):-shutle(Sid,Sname,_),passanger(Pid,_,LastNP,_),journey(_,Sid,_,Pid,Date).

%2)Знайти назву планети - PlName  на котру полетить/полетів шатл з назвою Sname, певного дня - Date
find_planet(PlName, Sname,Date):-shutle(Sid, Sname,_), planet(PLid, PlName), journey(_,Sid,PLid,_,Date). 

%3)Знайти назви кораблів - Sname, що в есплуатації вже більше певної кількості років - Years, від дати - Current_Date 
find_exploitation(Sname, Years, Current_Date):-shutle(_, Sname, ExDate), (Current_Date-ExDate)>Years.

%4)Знайти назви планет - PlName на котрих побував пасажир з прізвищем - Pname
planet_attandance(PlName, Pname):- planet(PLid, PlName),passanger(Pid,_,Pname,_),journey(_,_,PLid,Pid,_).

%5)Знайти прізвища усіх пасажирів - Pname, шатлу з іменем - Sname, що перевіз/перевезе хз на планету під назвою - PlName
find_passanger(Pname, Sname, PlName):-planet(PLid, PlName), shutle(Sid, Sname,_),passanger(Pid,_,Pname,_),journey(_,Sid,PLid,Pid,_).  
