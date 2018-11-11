using System;
using NUnit.Framework;
using Dijitle.API.Controllers;

namespace Dijitle.API.Tests
{
    [TestFixture, Category("UnitTests")]
    public class ValueControllerTests
    {
        private ValuesController _vc;

        [SetUp]
        public void Setup()
        {
            _vc = new ValuesController();
        }

        [Test]
        public void TestGet()
        {
            //arrage
            string[] expected = new string[] { "value1", "value2" };
            string[] actual = (string[])_vc.Get().Value;

            //assert
            CollectionAssert.AreEqual(expected, actual);
        }

        [TearDown]
        public void TearDown()
        {
            _vc = null;
        }
    }
}
