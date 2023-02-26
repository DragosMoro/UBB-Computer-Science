using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LaboratorSuplimentar.domain
{
    internal class Entity<ID>
    {
        public ID id { get; set; }
         public ID Id
        {
            get { return id; }
            set { id = value; }
        }
        public Entity(ID _id) {
            id = _id;
        }
       
    }
}