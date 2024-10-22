'use strict';

const { Insect } = require('../models');

// const seedInsectsInAnAnnoyingManualFashion = [
//     {
//         name: 'Western Pygmy Blue Butterfly',
//         description:
//             'Though they appear ornate and delicate, prehistoric fossils suggests that butterflies have been around for more than 200 million years.',
//         territory: 'Bruh Idk',
//         fact: 'You should look it up yourself',
//         millimeters: 6.9,
//     },
//     {
//         name: 'Some Other Insect',
//         description: 'aiowejefoaiwjfeoaiwejf',
//         territory: 'aoweifjaoweifjaowerigj',
//         fact: 'Fun fact, actually not a real insect!',
//         millimeters: 0.1,
//     },
// ];

const gigaChadGPTInsects = [
    {
        name: 'Monarch Butterfly',
        description:
            'Famous for their long migrations, Monarch butterflies can travel up to 3,000 miles from North America to central Mexico.',
        territory: 'North America, Mexico',
        fact: "Monarch butterflies use the Earth's magnetic field to help them navigate.",
        millimeters: 100.5,
    },
    {
        name: 'Atlas Moth',
        description:
            'One of the largest moths in the world, with wingspans reaching up to 24 cm.',
        territory: 'Southeast Asia',
        fact: 'Atlas moths do not have mouths; they rely on stored fat from their caterpillar stage to survive.',
        millimeters: 240.5,
    },
    {
        name: 'Bombardier Beetle',
        description:
            'This beetle can eject a hot, noxious chemical spray as a defense mechanism.',
        territory: 'Worldwide, especially in tropical regions',
        fact: 'The chemical spray can reach up to 100 degrees Celsius.',
        millimeters: 20.5,
    },
    {
        name: 'Goliath Beetle',
        description:
            'Goliath beetles are among the heaviest insects on Earth, weighing up to 100 grams.',
        territory: 'Tropical Africa',
        fact: 'Their larvae can grow up to 11 cm long and weigh over 100 grams.',
        millimeters: 110.5,
    },
    {
        name: 'Praying Mantis',
        description:
            'Named for their unique posture, mantises are predatory insects known for their fast reflexes.',
        territory: 'Worldwide, especially in tropical and temperate regions',
        fact: 'Female mantises sometimes eat their mates after reproduction.',
        millimeters: 75.5,
    },
    {
        name: 'Tarantula Hawk Wasp',
        description:
            'A large wasp species known for its incredibly painful sting, used to paralyze tarantulas.',
        territory: 'Americas, Asia, Africa',
        fact: 'The sting of the tarantula hawk is one of the most painful insect stings in the world.',
        millimeters: 50.5,
    },
    {
        name: 'Honeybee',
        description:
            'Honeybees are crucial pollinators, playing a key role in the ecosystem by helping plants reproduce.',
        territory: 'Worldwide',
        fact: 'A single honeybee will only produce about 1/12th of a teaspoon of honey in its lifetime.',
        millimeters: 15.5,
    },
    {
        name: 'Giant Weta',
        description:
            'A prehistoric insect species from New Zealand that can weigh as much as a small bird.',
        territory: 'New Zealand',
        fact: 'The giant weta is one of the heaviest insects in the world, weighing up to 70 grams.',
        millimeters: 100.5,
    },
    {
        name: 'Dragonfly',
        description:
            'Known for their excellent flying abilities, dragonflies can hover, fly backward, and reach speeds up to 35 mph.',
        territory: 'Worldwide',
        fact: 'Dragonflies have been around for over 300 million years, predating the dinosaurs.',
        millimeters: 80.5,
    },
    {
        name: 'Japanese Giant Hornet',
        description:
            'The largest hornet species, known for its aggressive behavior and potent venom.',
        territory: 'Japan, Eastern Asia',
        fact: 'Its sting can be deadly to humans, especially those allergic to its venom.',
        millimeters: 45.5,
    },
];

module.exports = {
    async up(queryInterface, Sequelize) {
        /**
         * Add seed commands here.
         *
         * Example:
         * await queryInterface.bulkInsert('People', [{
         *   name: 'John Doe',
         *   isBetaMember: false
         * }], {});
         */
        await Insect.bulkCreate(gigaChadGPTInsects, {
            validate: true,
        });
    },

    async down(queryInterface, Sequelize) {
        /**
         * Add commands to revert seed here.
         *
         * Example:
         * await queryInterface.bulkDelete('People', null, {});
         */
        await queryInterface.bulkDelete('Insects', {
            name: gigaChadGPTInsects.map((el) => el.name),
        });
    },
};
