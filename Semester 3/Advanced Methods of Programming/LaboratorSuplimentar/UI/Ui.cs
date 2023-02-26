using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LaboratorSuplimentar.domain;
using LaboratorSuplimentar.service;

namespace LaboratorSuplimentar.UI
{
    internal class UI<ID>
    {
        private Service<ID> service;
        public UI(Service<ID> service)
        {
            this.service = service;
            run();
        }
        private delegate void executeTaskDelegate();

        private void showTeams()
        {
            List<Echipa<ID>> echipe = service.getEchipe();
            foreach (Echipa<ID> echipa in echipe)
            {
                Console.WriteLine(echipa);
            }
        }
        private void run()
        {
            executeTaskDelegate taskExecuter;
            while (true)
            {
                
                Console.Write(">>>");
                string option = Console.ReadLine();
                
                switch (option)
                {
                    case "1":
                        taskExecuter = new executeTaskDelegate(task1);
                        break;
                    case "2":
                        taskExecuter= new executeTaskDelegate(task2);
                        break;
                    case "3":
                        taskExecuter= new executeTaskDelegate(task3);
                        break;
                    case "4":
                        taskExecuter= new executeTaskDelegate(task4);
                        break;
                    case "0":
                        Environment.Exit(0);
                        return;
                    default:
                        taskExecuter= new executeTaskDelegate(showMenu);
                        break;
                }
                taskExecuter();

            }
        }
        private void showMenu()
        {
            Console.WriteLine("1. Sa se afiseze toti jucatorii unei echipe dată");
            Console.WriteLine("2. Sa se afiseze toti jucatorii activi ai unei echipe de la un anumit meci");
            Console.WriteLine("3. Sa se afiseze toate meciurile dintr-o anumita perioada calendaristica");
            Console.WriteLine("4. Sa se determine si sa se afiseze scorul de la un anumit meci ");
            Console.WriteLine("0. Exit ");


        }
        private void showMeciuri()
        {
            List<Meci<ID>> meciuri = service.getMeciuri();
            foreach (Meci<ID> meci in meciuri)
            {
                Console.WriteLine(meci);
            }
        }
        private void task1()
        {
            showTeams();
            Console.Write("Enter the name of the team: ");
            string echipa=Console.ReadLine();
            List<Jucator<ID>> jucatoriEchipa = service.getJucatoriPentruEchipa(echipa);
            foreach(var jucator in jucatoriEchipa)
            {
                Console.WriteLine(jucator);
            }
        }
        private void task2()
        {
            showMeciuri();
            showTeams();
            Console.WriteLine("Introduceti numele echipei: ");
            string echipa=Console.ReadLine();
            showMeciuri();
            Console.WriteLine("Introduceti ID-ul meciului   : ");
            string idMeciS=Console.ReadLine();
            try
            {
                ID idMeci = (ID)Convert.ChangeType(idMeciS, typeof(ID));
                List<JucatorActiv<ID>> jucatoriActiviPtMeci = service.getJucatoriActiviPentruEchipaLaMeci(echipa, idMeci);
                foreach (var jucator in jucatoriActiviPtMeci)
                {
                    Console.WriteLine(jucator);
                }
            }
            catch (Exception ex) { Console.WriteLine("Input gresit!"); }
        }

        private void task3()
        {

            Console.WriteLine("Introduceti 2 date cu acest format DD.MM.YYYY HH:MM:SS");
            Console.WriteLine("Data 1: ");
            string data1 = Console.ReadLine();
            Console.WriteLine("Data 2: ");
            string data2 = Console.ReadLine();

            try
            {
                List<Meci<ID>> meciuriIntreDate = service.getMeciuriBetweenDates(data1, data2);
                foreach (var meci in meciuriIntreDate)
                {
                    Console.WriteLine(meci);
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Input gresit!");
            }
        }
        private void task4()
        {
            showMeciuri();
            Console.WriteLine("Introduceti ID-ul meciului: ");
            string idMeciS = Console.ReadLine();
            ID idMeci = (ID)Convert.ChangeType(idMeciS, typeof(ID));
            string scor = service.getScorPentruMeci(idMeci);
            Console.WriteLine(scor);
        }

    }

}