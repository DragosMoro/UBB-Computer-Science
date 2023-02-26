using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LaboratorSuplimentar.domain
{
    internal class Meci<ID> : Entity<ID >
    {
         private Echipa<ID> echipa1;
        private Echipa<ID> echipa2;
        private DateTime data;
        public DateTime Data { get { return data; } set { data = value; } }
        public Echipa<ID> Echipa1 { get { return echipa1; } set { echipa1 = value; } }
        public Echipa<ID> Echipa2 { get { return echipa2; } set { echipa2 = value; } }

        public Meci(ID id,Echipa<ID> echipa1, Echipa<ID> echipa2, DateTime data) : base(id)
        {
            this.echipa2= echipa2;
            this.echipa1= echipa1;
            this.data = data;

        }

        public override string? ToString()
        {
            return base.ToString()+"Echipa 1: "+echipa1.ToString()+"\tEchipa 2: "+echipa2.ToString()+" "+data.ToString()+"\n";
        }
    }
    }