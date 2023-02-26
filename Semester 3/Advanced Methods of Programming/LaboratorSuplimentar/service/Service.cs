using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LaboratorSuplimentar.domain;
using LaboratorSuplimentar.repository;

namespace LaboratorSuplimentar.service
{
    internal class Service<ID>
    {
        private MeciRepo<ID> meciRepo;
        private JucatoriRepo<ID> jucatoriRepo;
        private EchipeRepo<ID> echipeRepo;
        private JucatoriActiviRepo<ID> jucatoriActiviRepo;

        public Service(MeciRepo<ID> meciRepo, JucatoriRepo<ID> jucatoriRepo, EchipeRepo<ID> echipeRepo, JucatoriActiviRepo<ID> jucatoriActiviRepo)
        {
            this.meciRepo = meciRepo;
            this.jucatoriRepo = jucatoriRepo;
            this.echipeRepo = echipeRepo;
            this.jucatoriActiviRepo = jucatoriActiviRepo;
        }
        public ArrayList testFunction()
        {
            ArrayList filepaths = new ArrayList();
            filepaths.Add(meciRepo.testFunction());
            filepaths.Add(jucatoriRepo.testFunction());
            filepaths.Add(echipeRepo.testFunction());
            filepaths.Add(jucatoriActiviRepo.testFunction());

            return filepaths;
        }


        public List<Jucator<ID>> getJucatoriPentruEchipa(string nume_echipa)
        {
            var jucatori = jucatoriRepo.GetAll();
            var jucatoriPentruEchipa = jucatori.Where(x => x.EchipaJucator.Nume == nume_echipa).ToList();
            return jucatoriPentruEchipa;
        }

        public List<JucatorActiv<ID>> getJucatoriActiviPentruEchipaLaMeci(string nume_echipa, ID id_meci)
        {
            var jucatoriActivi = jucatoriActiviRepo.GetAll();
            var meci = meciRepo.findByID(id_meci);
            var jucatoriPtEchipaLaMeci = jucatoriActivi.Where(j => j.IdMeci.Equals(id_meci) && jucatoriRepo.findByID(j.IdJucator).EchipaJucator.Nume == nume_echipa).ToList();
            return jucatoriPtEchipaLaMeci;
        }

        public List<Meci<ID>> getMeciuriBetweenDates(string date1S, string date2S)
        {
            DateTime date1 = DateTime.Parse(date1S);
            DateTime date2 = DateTime.Parse(date2S);
            List<Meci<ID>> meciuri = (List<Meci<ID>>)meciRepo.GetAll();
            List<Meci<ID>> meciuriInPerioada = new List<Meci<ID>>();

            meciuriInPerioada = meciuri.FindAll(meci => date1.CompareTo(meci.Data) <= 0 && date2.CompareTo(meci.Data) >= 0);

            return meciuriInPerioada;

        }
        public string getScorPentruMeci(ID idMeci)
        {
            Meci<ID> meci = meciRepo.findByID(idMeci);
            List<JucatorActiv<ID>> jucatoriActivi = (List<JucatorActiv<ID>>)jucatoriActiviRepo.GetAll();
            List<JucatorActiv<ID>> jucatoriInMeci = new List<JucatorActiv<ID>>();
            jucatoriInMeci = jucatoriActivi.FindAll(jucator => jucator.IdMeci.Equals(idMeci));

            Dictionary<string, int> scor = new Dictionary<string, int>();


            scor.Add(meci.Echipa1.Nume, 0);
            scor.Add(meci.Echipa2.Nume, 0);


            foreach (JucatorActiv<ID> jucator in jucatoriInMeci)
            {
                string numeEchipa = jucatoriRepo.findByID(jucator.IdJucator).EchipaJucator.Nume;
                scor[numeEchipa] += jucator.NrPuncteInscrise;

            }

            string scor_string = scor.Keys.ToArray()[0] + "-" + scor.Keys.ToArray()[1] + " | ";
            foreach (string key in scor.Keys.ToArray())
            {
                scor_string += scor[key].ToString() + " ";
            }
            scor_string += "";
            return scor_string;
        }

        public List<Echipa<ID>> getEchipe()
        {
            return (List<Echipa<ID>>)echipeRepo.GetAll();
        }
        public List<JucatorActiv<ID>> getJucatoriActivi()
        {
            return (List<JucatorActiv<ID>>)jucatoriActiviRepo.GetAll();
        }
        public List<Meci<ID>> getMeciuri()
        {
            return (List<Meci<ID>>)meciRepo.GetAll();
        }
        public List<Jucator<ID>> getJucatori()
        {
            return (List<Jucator<ID>>)jucatoriRepo.GetAll();
        }

    }
}