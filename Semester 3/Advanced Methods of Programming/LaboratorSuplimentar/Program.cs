using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using LaboratorSuplimentar.domain;

using LaboratorSuplimentar.repository;
using LaboratorSuplimentar.service;
using LaboratorSuplimentar.UI;

namespace LaboratorSuplimentar
{
    class Application
{
    public static void Main(String[] args)
    {
        string filepathJucatori = "E:\\lab_c#\\LaboratorSuplimentar\\data\\jucatori.csv";
        string filepathJucatoriActivi = "E:\\lab_c#\\LaboratorSuplimentar\\data\\jucatoriActivi.csv";
        string filepathMeci = "E:\\lab_c#\\LaboratorSuplimentar\\data\\meciuri.csv";
        string filepathEchipe = "E:\\lab_c#\\LaboratorSuplimentar\\data\\echipe.csv";
        AbstractRepository<int, Echipa<int>> echipaRepo = new EchipeRepo<int>(filepathEchipe);
        AbstractRepository<int, Jucator<int>> jucatorRepo = new JucatoriRepo<int>(filepathJucatori,(EchipeRepo<int>)echipaRepo);
        AbstractRepository<int,Meci<int>> meciRepo = new MeciRepo<int>(filepathMeci, (EchipeRepo<int>)echipaRepo);
        AbstractRepository<int,JucatorActiv<int>> jucatorActivRepo = new JucatoriActiviRepo<int>(filepathJucatoriActivi);
        Service<int> service = new Service<int>((MeciRepo<int>)meciRepo, (JucatoriRepo<int>)jucatorRepo, (EchipeRepo<int>)echipaRepo, (JucatoriActiviRepo<int>)jucatorActivRepo);
        UI<int> ui = new UI<int>(service);

        service.getJucatoriPentruEchipa("Chicago Bulls");
        service.getJucatoriActiviPentruEchipaLaMeci("Chicago Bulls", 1);
        service.getScorPentruMeci(1);
        service.getMeciuriBetweenDates("31.12.2022", "04.01.2023");


    }
}
}