using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LaboratorSuplimentar.domain
{
    internal class Jucator<ID> : Elev<ID>
    {
        private Echipa<ID> echipaJucator;
        public Echipa<ID> EchipaJucator { get { return echipaJucator; } set { echipaJucator = value; } }
        
       

        public Jucator(ID id, string nume, string scoala, Echipa<ID> echipa) : base(id, nume, scoala)
        {
            this.echipaJucator = echipa;
        }

        public override string? ToString()
        {
            return base.ToString()+" "+echipaJucator.ToString()+"\n";
        }
        
    }

}