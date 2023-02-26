using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LaboratorSuplimentar.domain;

namespace LaboratorSuplimentar.repository
{
   internal interface IRepository<ID, E> where E : Entity<ID>
    {
        IEnumerable<E> GetAll();
    }
}